import 'dart:async';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:interactive_map_vienna_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class WaterStationEndpoint extends Endpoint {
  Future<void> uploadWaterStations(Session session) async {
    // Path to the CSV file
    final filePath = 'content/TRINKBRUNNENOGD.csv';

    try {
      // Read the file as a string
      final input = File(filePath).readAsStringSync();

      // Parse the CSV
      final rowsAsListOfValues = const CsvToListConverter().convert(input);

      // Print the header for reference
      print('CSV Header:');
      print(rowsAsListOfValues[0]);
      print('');

      // Extract and print only the relevant water station data
      print('Water Station Data:');
      print('Format: [objectId, name, latitude, longitude]');
      print('');

      for (var i = 1; i < rowsAsListOfValues.length; i++) {
        final row = rowsAsListOfValues[i];
        if (row.length >= 3) {
          // Extract the objectId from the first column (typically OBJECTID)
          final objectId = row[1]?.toString() ?? '';

          // Extract the name/type from BASIS_TYP_TXT (index 3)
          final name = row.length > 3 ? row[3]?.toString() ?? 'Unknown' : 'Unknown';

          // Extract coordinates from SHAPE column (index 2)
          // Format is typically "POINT (longitude latitude)"
          String latitude = '';
          String longitude = '';

          if (row.length > 2 && row[2] != null) {
            final pointStr = row[2].toString();
            final coordMatch = RegExp(r'POINT \(([0-9.]+) ([0-9.]+)\)').firstMatch(pointStr);

            if (coordMatch != null && coordMatch.groupCount >= 2) {
              longitude = coordMatch.group(1) ?? '';
              latitude = coordMatch.group(2) ?? '';
            }
          }

          final waterStation = WaterStation(
              objectId: objectId, type: name, latitude: double.parse(latitude), longitude: double.parse(longitude));

          // Save the recipe to the database, the returned recipe has the id set
          final waterStationWithId = await WaterStation.db.insertRow(session, waterStation);

          // Print the extracted data
          print('[$objectId, $name, $latitude, $longitude]');
        }
      }

      print('');
      print('Total water stations processed: ${rowsAsListOfValues.length - 1}');
    } catch (e) {
      print('Error reading or parsing the CSV file: $e');
    }
  }

  /// This method returns all the generated recipes from the database.
  Future<List<WaterStation>> getWaterStations(Session session) async {
    // Get all the recipes from the database, sorted by date.
    return WaterStation.db.find(
      session,
      orderBy: (t) => t.type,
      orderDescending: true,
    );
  }
}

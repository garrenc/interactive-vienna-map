import 'dart:async';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:interactive_map_vienna_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ToiletEndpoint extends Endpoint {
  Future<void> uploadToilets(Session session) async {
    // Path to the CSV file
    final filePath = 'content/WCANLAGE2OGD.csv';

    try {
      // Read the file as a string
      final input = File(filePath).readAsStringSync();

      // Parse the CSV
      final rowsAsListOfValues = const CsvToListConverter().convert(input);

      // Print the header for reference
      session.log('CSV Header:');
      session.log('${rowsAsListOfValues[0]}');

      // Column indices from the CSV
      // FID,OBJECTID,SHAPE,WC_ID,BEZIRK,STRASSE,ORTSANGABE,AKTIV,AKTIV_TXT,OEFFNUNGSZEIT,EINSCHRAENKUNGEN,
      // PERSONALBETREUUNG,KATEGORIE,AUSSTATTUNG,ICON,ICON_TXT,KONTAKT,ABTEILUNG,INFORMATION,SE_ANNO_CAD_DATA
      const int objectIdIdx = 1;
      const int shapeIdx = 2;
      const int wcIdIdx = 3;
      const int districtIdx = 4;
      const int streetIdx = 5;
      const int locationDetailsIdx = 6;
      const int isActiveIdx = 7;
      const int openingHoursIdx = 9;
      const int restrictionsIdx = 10;
      const int staffSupervisionIdx = 11;
      const int categoryIdx = 12;
      const int equipmentIdx = 13;
      const int iconIdx = 14;
      const int iconTextIdx = 15;
      const int contactIdx = 16;
      const int departmentIdx = 17;
      const int informationIdx = 18;

      int successCount = 0;
      int errorCount = 0;

      // Process each row in the CSV
      for (var i = 1; i < rowsAsListOfValues.length; i++) {
        final row = rowsAsListOfValues[i];

        // Skip rows with insufficient data
        if (row.length <= informationIdx) {
          session.log('Skipping row $i: insufficient columns');
          continue;
        }

        try {
          // Extract the objectId
          final objectId = row[objectIdIdx]?.toString() ?? '';

          // Extract coordinates from SHAPE column
          String latitude = '0.0';
          String longitude = '0.0';

          if (row[shapeIdx] != null) {
            final pointStr = row[shapeIdx].toString();
            final coordMatch = RegExp(r'POINT \(([0-9.]+) ([0-9.]+)\)').firstMatch(pointStr);

            if (coordMatch != null && coordMatch.groupCount >= 2) {
              longitude = coordMatch.group(1) ?? '0.0';
              latitude = coordMatch.group(2) ?? '0.0';
            }
          }

          // Extract other fields
          final wcId = row[wcIdIdx]?.toString() ?? '';
          final district = row[districtIdx]?.toString() ?? '';
          final street = row[streetIdx]?.toString() ?? '';
          final locationDetails = row[locationDetailsIdx]?.toString();

          // Convert -1 to true, 0 to false for isActive
          final isActive = row[isActiveIdx] == -1;

          final openingHours = row[openingHoursIdx]?.toString() ?? '';
          final restrictions = row[restrictionsIdx]?.toString() ?? '';
          final staffSupervision = row[staffSupervisionIdx]?.toString() ?? '';
          final category = row[categoryIdx]?.toString() ?? '';
          final equipment = row[equipmentIdx]?.toString() ?? '';
          final icon = row[iconIdx]?.toString() ?? '';
          final iconText = row[iconTextIdx]?.toString() ?? '';
          final contact = row[contactIdx]?.toString() ?? '';
          final department = row[departmentIdx]?.toString() ?? '';
          final information = row[informationIdx]?.toString() ?? '';

          // Create the Toilet object
          final toilet = Toilet(
            objectId: objectId,
            wcId: wcId,
            district: district,
            street: street,
            locationDetails: locationDetails,
            isActive: isActive,
            openingHours: openingHours,
            restrictions: restrictions,
            staffSupervision: staffSupervision,
            category: category,
            equipment: equipment,
            icon: icon,
            iconText: iconText,
            contact: contact,
            department: department,
            information: information,
            latitude: double.tryParse(latitude) ?? 0.0,
            longitude: double.tryParse(longitude) ?? 0.0,
          );

          // Save to the database
          await Toilet.db.insertRow(session, toilet);
          successCount++;

          if (successCount % 50 == 0) {
            session.log('Processed $successCount toilets...');
          }
        } catch (e) {
          session.log('Error processing row $i: $e');
          errorCount++;
        }
      }

      session.log('Upload complete: $successCount toilets added, $errorCount errors');
    } catch (e) {
      session.log('Error reading or parsing the CSV file: $e');
      throw Exception('Failed to upload toilets: $e');
    }
  }

  // /// Returns all toilets from the database.
  // Future<List<Toilet>> getToilets(Session session) async {
  //   return Toilet.db.find(
  //     session,
  //     orderBy: (t) => t.district,
  //   );
  // }

  // /// Returns toilets filtered by district
  // Future<List<Toilet>> getToiletsByDistrict(Session session, String district) async {
  //   return Toilet.db.find(
  //     session,
  //     where: (t) => t.district.equals(district),
  //   );
  // }

  // /// Returns toilets near a specific location within the given radius (in kilometers)
  // Future<List<Toilet>> getToiletsNearLocation(
  //     Session session, double latitude, double longitude, double radiusKm) async {
  //   // Convert kilometers to degrees (approximate)
  //   // 1 degree of latitude is approximately 111 km
  //   final latDelta = radiusKm / 111.0;

  //   // 1 degree of longitude varies with latitude, so adjust accordingly
  //   final longDelta = radiusKm / (111.0 * cos(latitude * pi / 180));

  //   return Toilet.db.find(
  //     session,
  //     where: (t) =>
  //         t.latitude.between(latitude - latDelta, latitude + latDelta) &
  //         t.longitude.between(longitude - longDelta, longitude + longDelta),
  //   );
  // }
}

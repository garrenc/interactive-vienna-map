import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:interactive_map_vienna_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class POIEndpoint extends Endpoint {
  /// Detects the encoding of a file by checking for UTF-8 BOM and UTF-8 validity
  String detectFileEncoding(List<int> bytes) {
    // Check for UTF-8 BOM (Byte Order Mark)
    if (bytes.length >= 3 && bytes[0] == 0xEF && bytes[1] == 0xBB && bytes[2] == 0xBF) {
      return 'UTF-8 with BOM';
    }

    // Try to decode as UTF-8
    try {
      utf8.decode(bytes);
      return 'UTF-8';
    } catch (_) {
      // If UTF-8 decoding fails, it's likely Windows-1252 or ISO-8859-1
      return 'Windows-1252/ISO-8859-1';
    }
  }

  /// Tests different encodings and returns sample text for each
  Future<void> testEncodings(Session session, String filePath) async {
    final bytes = File(filePath).readAsBytesSync();

    // Test different encodings
    final encodings = {
      'UTF-8': () => utf8.decode(bytes, allowMalformed: true),
      'Latin-1': () => latin1.decode(bytes),
      'Windows-1252': () => latin1.decode(bytes), // Same as Latin-1 in Dart
      'ASCII': () => ascii.decode(bytes, allowInvalid: true),
      'ISO-8859-1': () => latin1.decode(bytes), // Same as Latin-1 in Dart
    };

    // Try each encoding and log a sample
    for (final entry in encodings.entries) {
      try {
        final decodedText = entry.value();
        // Get first 100 characters as a sample
        final sample = decodedText.length > 100 ? decodedText.substring(0, 100) : decodedText;
        session.log('${entry.key} sample: $sample');
      } catch (e) {
        session.log('${entry.key} decoding error: $e');
      }
    }
  }

  /// Specifically tests CSV parsing with different encodings
  Future<void> testCsvEncodings(Session session, String filePath) async {
    final bytes = File(filePath).readAsBytesSync();

    // Test different encodings
    final encodings = {
      'UTF-8': utf8.decode(bytes, allowMalformed: true),
      'Latin-1': latin1.decode(bytes),
      'ASCII': ascii.decode(bytes, allowInvalid: true),
    };

    // Try parsing CSV with each encoding
    for (final entry in encodings.entries) {
      try {
        final decodedText = entry.value;
        final rows = const CsvToListConverter(fieldDelimiter: ';').convert(decodedText);

        if (rows.isNotEmpty && rows[0].isNotEmpty) {
          // Get the first row (header) and first few data rows
          final header = rows[0];
          final dataRows = rows.length > 3 ? rows.sublist(1, 4) : rows.sublist(1);

          session.log('${entry.key} CSV parsing:');
          session.log('Header: $header');
          for (int i = 0; i < dataRows.length; i++) {
            session.log('Row ${i + 1}: ${dataRows[i]}');
          }
        }
      } catch (e) {
        session.log('${entry.key} CSV parsing error: $e');
      }
    }
  }

  Future<void> uploadPOIs(Session session) async {
    // Path to the CSV file
    final filePath = 'content/top-locations-wien.csv';

    try {
      // Test different encodings to determine the correct one
      await testEncodings(session, filePath);
      await testCsvEncodings(session, filePath);

      // Read the file as bytes
      final bytes = File(filePath).readAsBytesSync();

      // Based on testing, use Latin-1 (ISO-8859-1) encoding for this file
      // This works best for German umlauts and special characters
      final input = latin1.decode(bytes);
      session.log('Using Latin-1/ISO-8859-1 encoding for processing');

      // Parse the CSV with semicolon delimiter
      final rowsAsListOfValues = const CsvToListConverter(fieldDelimiter: ';').convert(input);

      // Print the header for reference
      session.log('CSV Header:');
      session.log('${rowsAsListOfValues[0]}');

      // Define column indices based on the CSV structure
      const int titleIdx = 0;
      const int categoryIdx = 1;
      const int descriptionIdx = 2;
      const int addressIdx = 3;
      const int zipIdx = 4;
      const int cityIdx = 5;
      const int latitudeIdx = 6;
      const int longitudeIdx = 7;
      const int tel1Idx = 8;
      const int tel1CommentIdx = 9;
      const int tel2Idx = 10;
      const int tel2CommentIdx = 11;
      const int tel3Idx = 12;
      const int tel3CommentIdx = 13;
      const int emailIdx = 14;
      const int webUrlIdx = 15;
      const int urlIdx = 16;
      // Note: imageUrl is not in the CSV, will be set to null

      int successCount = 0;
      int errorCount = 0;

      // Process each row in the CSV (skip header)
      for (var i = 1; i < rowsAsListOfValues.length; i++) {
        final row = rowsAsListOfValues[i];

        // Skip rows with insufficient data
        if (row.length <= urlIdx) {
          session.log('Skipping row $i: insufficient columns');
          continue;
        }

        try {
          // Extract fields from the CSV row
          final title = row[titleIdx]?.toString() ?? '';
          final category = row[categoryIdx]?.toString();
          final description = row[descriptionIdx]?.toString();
          final address = row[addressIdx]?.toString();
          final zip = row[zipIdx]?.toString();
          final city = row[cityIdx]?.toString();

          // Parse latitude and longitude (replace comma with dot for decimal)
          final latitude = row[latitudeIdx] != null && row[latitudeIdx].toString().isNotEmpty
              ? double.tryParse(row[latitudeIdx].toString().replaceAll(',', '.'))
              : null;

          final longitude = row[longitudeIdx] != null && row[longitudeIdx].toString().isNotEmpty
              ? double.tryParse(row[longitudeIdx].toString().replaceAll(',', '.'))
              : null;

          // Extract contact information
          final tel1 = row[tel1Idx]?.toString();
          final tel1Comment = row[tel1CommentIdx]?.toString();
          final tel2 = row[tel2Idx]?.toString();
          final tel2Comment = row[tel2CommentIdx]?.toString();
          final tel3 = row[tel3Idx]?.toString();
          final tel3Comment = row[tel3CommentIdx]?.toString();

          // Extract online information
          final email = row[emailIdx]?.toString();
          final webUrl = row[webUrlIdx]?.toString();
          final url = row[urlIdx]?.toString();

          // Create image URL from the URL if available
          String? imageUrl;
          if (url != null && url.isNotEmpty) {
            // Extract the last part of the URL to use as image reference
            final urlParts = url.split('/');
            if (urlParts.isNotEmpty) {
              final lastPart = urlParts.last;
              if (lastPart.isNotEmpty) {
                imageUrl =
                    'https://www.wien.info/resource/image/290722/3x2/700/467/f1ed35265223eff303b85eea9b20bc6f/Cr/21er-haus-museum-moderner-kunst-belvedere.jpg';
              }
            }
          }

          // Create the POI object
          final poi = POI(
            title: title,
            category: category,
            description: description,
            address: address,
            zip: zip,
            city: city,
            latitude: latitude,
            longitude: longitude,
            tel1: tel1,
            tel1Comment: tel1Comment,
            tel2: tel2,
            tel2Comment: tel2Comment,
            tel3: tel3,
            tel3Comment: tel3Comment,
            email: email,
            webUrl: webUrl,
            url: url,
            imageUrl: imageUrl,
          );

          // Save to the database
          await POI.db.insertRow(session, poi);
          successCount++;

          if (successCount % 20 == 0) {
            session.log('Processed $successCount POIs...');
          }
        } catch (e) {
          session.log('Error processing row $i: $e');
          errorCount++;
        }
      }

      session.log('Upload complete: $successCount POIs added, $errorCount errors');
    } catch (e) {
      session.log('Error reading or parsing the CSV file: $e');
      throw Exception('Failed to upload POIs: $e');
    }
  }

  /// Returns all POIs from the database.
  Future<List<POI>> getPOIs(Session session) async {
    return POI.db.find(
      session,
      orderBy: (p) => p.title,
    );
  }

  Future<POI> getTextToPoi(Session session, int poiId) async {
    final poi = await POI.db.findById(session, poiId);

    if (poi == null) {
      throw Exception('POI not found');
    }
    if (poi.description != null && poi.description!.length >= 500) {
      return poi;
    }

    final geminiApiKey = session.passwords['gemini'];
    if (geminiApiKey == null) {
      throw Exception('Gemini API key not found');
    }
    final gemini = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: geminiApiKey,
    );

    // A prompt to generate a recipe, the user will provide a free text input with the ingredients
    final prompt =
        'Give me information about the following place in vienna with at least 500 characters: ${poi.title} and location: ${poi.address}, ${poi.zip}';

    final response = await gemini.generateContent([Content.text(prompt)]);
    final responseText = response.text;

    // Check if the response is empty or null
    if (responseText == null || responseText.isEmpty) {
      throw Exception('No response from Gemini API');
    }

    poi.description = responseText;

    await POI.db.updateRow(session, poi);

    return poi;
  }
}

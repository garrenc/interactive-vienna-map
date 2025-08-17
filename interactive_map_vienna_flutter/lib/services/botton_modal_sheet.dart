import 'package:flutter/material.dart';
import 'package:interactive_map_vienna_flutter/models/pinpoint.dart';
import 'package:interactive_map_vienna_flutter/widgets/bottom_sheet_info.dart';

class BottomModalSheetService {
  static Future<void> showBottomModalSheet(BuildContext context, {required Pinpoint pinpoint}) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetInfo(pinpoint: pinpoint),
    );
  }
}

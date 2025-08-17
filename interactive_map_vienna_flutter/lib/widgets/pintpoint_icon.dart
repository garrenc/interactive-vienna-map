import 'package:flutter/material.dart';
import 'package:interactive_map_vienna_flutter/models/pinpoint.dart';

class PinpointIcon extends StatelessWidget {
  final PinpointType type;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool hideTitle;
  const PinpointIcon({super.key, required this.type, this.onTap, this.isSelected = false, this.hideTitle = false});

  static const BorderRadius _borderRadius = BorderRadius.all(Radius.circular(30));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            Material(
              elevation: 6,
              borderRadius: _borderRadius,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isSelected ? type.color : Colors.white,
                  borderRadius: _borderRadius,
                ),
                child: Icon(type.icon, color: isSelected ? Colors.white : type.color, size: 24),
              ),
            ),
            SizedBox(height: 8),
            if (!hideTitle)
              Text(
                type.title,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

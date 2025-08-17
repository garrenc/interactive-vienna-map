import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:interactive_map_vienna_flutter/models/pinpoint.dart';
import 'package:interactive_map_vienna_flutter/widgets/pintpoint_icon.dart';

class FrostedAppBar extends StatefulWidget implements PreferredSizeWidget {
  const FrostedAppBar({super.key});

  // Heights for title row and the icons row
  static const double _toolbar = 110;
  static const double _iconsHeight = 64.0;

  @override
  State<FrostedAppBar> createState() => _FrostedAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(FrostedAppBar._toolbar + FrostedAppBar._iconsHeight);
}

class _FrostedAppBarState extends State<FrostedAppBar> {
  List<PinpointType> selectedPinpoints = [];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: FrostedAppBar._toolbar, // area for the title (excludes status bar)
      titleSpacing: 0,

      leading: Container(
        margin: const EdgeInsets.only(left: 8),
        child: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.black87,
            size: 30,
          ),
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      // Frosted background that reaches all the way up (under the notch)
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 7,
            sigmaY: 7,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.20),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
      ),

      // Title padded down by the status-bar height so it doesn’t clash with the notch
      title: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: const Text(
          'Hidden Map',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      // Icons row BELOW the title
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(FrostedAppBar._iconsHeight),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
          child: SizedBox(
            width: double.infinity, // let Row span the full width
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: PinpointType.values
                  .map((type) => PinpointIcon(
                      type: type,
                      isSelected: selectedPinpoints.contains(type),
                      onTap: () {
                        setState(() {
                          if (selectedPinpoints.contains(type)) {
                            selectedPinpoints.remove(type);
                          } else {
                            selectedPinpoints.add(type);
                          }
                        });
                      }))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

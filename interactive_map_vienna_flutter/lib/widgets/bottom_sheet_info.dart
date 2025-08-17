import 'package:flutter/material.dart';
import 'package:interactive_map_vienna_flutter/models/pinpoint.dart';
import 'package:interactive_map_vienna_flutter/widgets/pintpoint_icon.dart';

class BottomSheetInfo extends StatefulWidget {
  final Pinpoint pinpoint;
  const BottomSheetInfo({super.key, required this.pinpoint});

  @override
  State<BottomSheetInfo> createState() => _BottomSheetInfoState();
}

class _BottomSheetInfoState extends State<BottomSheetInfo> {
  final color = Color(0xFF28859F);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              PinpointIcon(type: widget.pinpoint.type, isSelected: true, hideTitle: true),
              Text(widget.pinpoint.title, style: TextStyle(fontSize: 20)),
            ],
          ),
          if (widget.pinpoint.description.isNotEmpty)
            Container(
              constraints: BoxConstraints(
                maxHeight: 170,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                widget.pinpoint.description,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                ...widget.pinpoint.type == PinpointType.audioGuide
                    ? [_buildIconButton(onTap: () {}, icon: Icon(Icons.play_arrow_rounded, size: 40, color: Colors.white), title: 'Play')]
                    : [
                        _buildInfoIconWidget(icon: Icons.euro, title: widget.pinpoint.type == PinpointType.toilet ? '50c' : 'Free'),
                        SizedBox(width: 26),
                        _buildInfoIconWidget(icon: Icons.access_time_outlined, title: widget.pinpoint.type == PinpointType.toilet ? 'Open 7-9' : '24/7'),
                      ],
                Spacer(),
                _buildIconButton(onTap: () {}, icon: Transform.rotate(angle: 5.5, child: Icon(Icons.navigation, size: 30, color: color)), title: 'Navigate', inversed: true),
              ],
            ),
          ),
          const Spacer(),
          if (widget.pinpoint.imageUrl != null && widget.pinpoint.imageUrl!.isNotEmpty)
            Container(
                padding: EdgeInsets.only(
                  bottom: 16,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    widget.pinpoint.imageUrl!,
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.cover,
                    alignment: Alignment(0.0, -0.1),
                  ),
                ))
          else if ((widget.pinpoint.type == PinpointType.toilet || widget.pinpoint.type == PinpointType.water) && widget.pinpoint.type.imageModal != null)
            Container(
              padding: EdgeInsets.only(
                bottom: 16,
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset('assets/images/${widget.pinpoint.type.imageModal}.png', height: 250, width: double.infinity, fit: BoxFit.cover)),
            ),
        ],
      ),
    );
  }

  Widget _buildIconButton({required VoidCallback onTap, required Widget icon, required String title, bool inversed = false}) {
    return Column(
      children: [
        Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(30),
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: inversed ? Colors.white : color,
                borderRadius: BorderRadius.circular(30),
              ),
              child: icon),
        ),
        SizedBox(height: 4),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildInfoIconWidget({required IconData icon, required String title}) {
    return Column(
      children: [
        Icon(icon),
        Text(title),
      ],
    );
  }
}

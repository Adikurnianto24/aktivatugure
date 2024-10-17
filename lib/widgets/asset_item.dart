import 'package:flutter/material.dart';

class AssetItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const AssetItem({
    super.key, // Use super parameter
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: InkResponse(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20), // Circular effect
            containedInkWell: true,
            highlightShape: BoxShape.circle, // Ensure circular highlight
            splashColor: color.withOpacity(0.3), // Customize splash color
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: color, size: 40),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}

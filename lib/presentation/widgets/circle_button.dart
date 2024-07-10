import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.color,
  });

  final void Function() onTap;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.4),
        ),
        child: Center(
          child: Icon(
            icon,
            color: color,
            size: 22,
          ),
        ),
      ),
    );
  }
}

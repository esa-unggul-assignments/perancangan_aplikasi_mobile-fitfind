import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color backgroundColor;
  final double borderRadius;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.labelColor,
    required this.backgroundColor,
    required this.borderRadius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: labelColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
      child: Text(
        label,
        style: TextStyle(color: labelColor),
      ),
    );
  }
}

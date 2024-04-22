import 'package:flutter/material.dart';

class ToggleRow extends StatelessWidget {
  final String label;
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const ToggleRow({
    Key? key,
    required this.label,
    required this.isEnabled,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Switch(
          value: isEnabled,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

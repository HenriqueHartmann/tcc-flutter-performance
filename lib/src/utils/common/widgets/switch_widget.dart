import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  final String title;
  final bool switchValue;
  final Function(bool) onChanged;

  const SwitchWidget({
    required this.title,
    required this.switchValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Switch(
              activeColor: Colors.red,
              inactiveThumbColor: Colors.blueGrey.shade600,
              inactiveTrackColor: Colors.grey.shade400,
              splashRadius: 50.0,
              value: switchValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}

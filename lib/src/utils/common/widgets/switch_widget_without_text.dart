import 'package:flutter/material.dart';

class SwitchWidgetWithoutText extends StatelessWidget {
  final bool switchValue;
  final Function(bool) onChanged;

  const SwitchWidgetWithoutText({
    required this.switchValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.red,
      inactiveThumbColor: Colors.blueGrey.shade600,
      inactiveTrackColor: Colors.grey.shade400,
      splashRadius: 50.0,
      value: switchValue,
      onChanged: onChanged,
    );
  }
}

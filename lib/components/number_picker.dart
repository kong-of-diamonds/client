import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class NumberPicker extends StatelessWidget {
  final void Function(dynamic) onChange;
  const NumberPicker(this.onChange, {super.key});

  @override
  Widget build(BuildContext context) {
    return WheelChooser.integer(
      onValueChanged: onChange,
      maxValue: 100,
      minValue: 0,
      initValue: 0,
      horizontal: true,
      unSelectTextStyle: const TextStyle(color: Colors.grey),
    );
  }
}

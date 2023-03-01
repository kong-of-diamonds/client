import 'package:flutter/material.dart';

class SubmitNumberPlaceholder extends StatelessWidget {
  final int pickedNumber;
  const SubmitNumberPlaceholder(this.pickedNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text("$pickedNumber");
  }
}

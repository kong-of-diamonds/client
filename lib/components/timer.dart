import 'package:flutter/material.dart';

class TimerView extends StatefulWidget {
  final int timeoutSec;
  const TimerView(this.timeoutSec, {super.key});
  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  @override
  Widget build(BuildContext context) {
    return const Text("0:00");
  }
}

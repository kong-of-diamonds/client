import 'dart:async';

import 'package:flutter/material.dart';

class TimerView extends StatefulWidget {
  final int deadline;
  const TimerView(this.deadline, {super.key});
  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  int timeLeft = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.deadline <= 0) return;
      timeLeft = _getTimeLeft();
      _runTimer();
    });
    super.initState();
  }

  void _runTimer() {
    Timer.periodic(const Duration(seconds: 1), _updateGameTimer);
  }

  void _updateGameTimer(Timer timer) {
    int left = _getTimeLeft();
    if (left <= 0) timer.cancel();
    setState(() {
      timeLeft = left;
    });
  }

  int _getTimeLeft() {
    return Duration(
            microseconds:
                widget.deadline - DateTime.now().toUtc().microsecondsSinceEpoch)
        .inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    return Text("$timeLeft");
  }
}

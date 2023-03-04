import 'package:flutter/material.dart';

class GameFactorView extends StatelessWidget {
  final double factor;
  const GameFactorView(this.factor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text("k=$factor")],
    );
  }
}

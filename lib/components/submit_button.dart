import 'package:flutter/material.dart';

class SubmitNumberButton extends StatelessWidget {
  final void Function() onSubmit;
  const SubmitNumberButton(this.onSubmit, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onSubmit, child: const Text("OK"));
  }
}

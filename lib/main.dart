import 'package:flutter/material.dart';
import 'package:kod_client/views/game_view.dart';

void main() {
  runApp(const KingOfDiamondsApp());
}

class KingOfDiamondsApp extends StatelessWidget {
  const KingOfDiamondsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameView(),
    );
  }
}

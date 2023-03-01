import 'package:flutter/material.dart';
import 'package:kod_client/components/loader.dart';
import 'package:kod_client/model/player.dart';

class PlayerListItem extends StatelessWidget {
  final Player? player;
  const PlayerListItem(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(player?.id ?? "..."),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: player == null
                        ? const CircularLoader()
                        : const Icon(Icons.person),
                  ),
                ),
              ),
              Positioned.fill(
                  bottom: 0,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(player == null ? "..." : "${player!.score}")))
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:kod_client/model/player.dart';
import 'package:kod_client/model/turn.dart';
import 'package:kod_client/model/game.dart';

part 'event.g.dart';

@JsonSerializable(createToJson: false)
class Event {
  final String id;
  final int type;
  final List<Player>? players;
  final Turn? turn;
  final Game? game;

  Event(this.id, this.type, this.players, this.turn, this.game);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

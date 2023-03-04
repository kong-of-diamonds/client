import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable(createToJson: false)
class Game {
  final double factor;
  @JsonKey(name: "max_players")
  final int maxPlayers;

  Game(this.factor, this.maxPlayers);

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable(createToJson: false)
class Player {
  final String id;
  final String name;
  final int score;

  Player(this.id, this.name, this.score);

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

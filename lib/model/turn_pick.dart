import 'package:json_annotation/json_annotation.dart';
import 'package:kod_client/model/player.dart';

part 'turn_pick.g.dart';

@JsonSerializable(createToJson: false)
class TurnPick {
  final Player player;
  final bool win;
  final int pickedNumber;

  TurnPick(this.player, this.win, this.pickedNumber);

  factory TurnPick.fromJson(Map<String, dynamic> json) =>
      _$TurnPickFromJson(json);
}

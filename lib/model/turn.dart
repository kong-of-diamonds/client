import 'package:json_annotation/json_annotation.dart';
import 'package:kod_client/model/turn_pick.dart';

part 'turn.g.dart';

@JsonSerializable(createToJson: false)
class Turn {
  final int created;
  final int deadline;
  @JsonKey(name: "win_number")
  final double winNumber;
  final List<TurnPick>? picks;

  Turn(this.created, this.deadline, this.winNumber, this.picks);

  factory Turn.fromJson(Map<String, dynamic> json) => _$TurnFromJson(json);
}

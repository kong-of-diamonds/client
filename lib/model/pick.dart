import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pick.g.dart';

@JsonSerializable(createFactory: false)
class Pick {
  final int number;
  Pick(this.number);
  Map<String, dynamic> toJson() => _$PickToJson(this);
  dynamic toData() => jsonEncode(toJson());
}

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'player_info.g.dart';

@JsonSerializable(createFactory: false)
class PLayerInfo {
  final String id;
  PLayerInfo(this.id);
  Map<String, dynamic> toJson() => _$PLayerInfoToJson(this);
  dynamic toData() => jsonEncode(toJson());
}

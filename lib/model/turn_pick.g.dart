// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn_pick.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurnPick _$TurnPickFromJson(Map<String, dynamic> json) => TurnPick(
      Player.fromJson(json['player'] as Map<String, dynamic>),
      json['win'] as bool,
      json['pickedNumber'] as int,
    );

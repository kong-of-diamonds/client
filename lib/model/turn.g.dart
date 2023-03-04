// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Turn _$TurnFromJson(Map<String, dynamic> json) => Turn(
      json['created'] as int,
      json['deadline'] as int,
      (json['win_number'] as num).toDouble(),
      (json['picks'] as List<dynamic>?)
          ?.map((e) => TurnPick.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

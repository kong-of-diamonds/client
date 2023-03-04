// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['id'] as String,
      json['type'] as int,
      (json['players'] as List<dynamic>?)
          ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['turn'] == null
          ? null
          : Turn.fromJson(json['turn'] as Map<String, dynamic>),
      json['game'] == null
          ? null
          : Game.fromJson(json['game'] as Map<String, dynamic>),
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity_cell _$Activity_cellFromJson(Map<String, dynamic> json) {
  return Activity_cell()
    ..screenshot = json['screenshot'] as String
    ..eventlUrl = json['eventlUrl'] as String
    ..title = json['title'] as String
    ..city = json['city'] as String
    ..startTime = json['startTime'] as String;
}

Map<String, dynamic> _$Activity_cellToJson(Activity_cell instance) =>
    <String, dynamic>{
      'screenshot': instance.screenshot,
      'eventlUrl': instance.eventlUrl,
      'title': instance.title,
      'city': instance.city,
      'startTime': instance.startTime
    };

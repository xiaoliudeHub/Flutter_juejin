// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repos_cell _$Repos_cellFromJson(Map<String, dynamic> json) {
  return Repos_cell()
    ..userName = json['userName'] as String
    ..repoName = json['repoName'] as String
    ..language = json['language'] as String
    ..stars = json['stars'] as num
    ..fork = json['fork'] as num
    ..description = json['description'] as String
    ..time = json['time'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$Repos_cellToJson(Repos_cell instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'repoName': instance.repoName,
      'language': instance.language,
      'stars': instance.stars,
      'fork': instance.fork,
      'description': instance.description,
      'time': instance.time,
      'url': instance.url
    };

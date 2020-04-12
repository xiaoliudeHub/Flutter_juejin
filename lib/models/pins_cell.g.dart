// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pins_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pins_cell _$Pins_cellFromJson(Map<String, dynamic> json) {
  return Pins_cell()
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..objectId = json['objectId'] as String
    ..uid = json['uid'] as String
    ..content = json['content'] as String
    ..pictures = (json['pictures'] as List)?.map((e) => e as String)?.toList()
    ..commentCount = json['commentCount'] as num
    ..likedCount = json['likedCount'] as num
    ..createdAt = json['createdAt'] as String
    ..url = json['url'] as String
    ..urlTitle = json['urlTitle'] as String
    ..urlPic = json['urlPic'] as String
    ..topic = json['topic'] == null
        ? null
        : Topic_info.fromJson(json['topic'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Pins_cellToJson(Pins_cell instance) => <String, dynamic>{
      'user': instance.user,
      'objectId': instance.objectId,
      'uid': instance.uid,
      'content': instance.content,
      'pictures': instance.pictures,
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'createdAt': instance.createdAt,
      'url': instance.url,
      'urlTitle': instance.urlTitle,
      'urlPic': instance.urlPic,
      'topic': instance.topic
    };

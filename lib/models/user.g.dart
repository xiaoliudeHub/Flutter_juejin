// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..avatarLarge = json['avatarLarge'] as String
    ..username = json['username'] as String
    ..jobTitle = json['jobTitle'] as String
    ..company = json['company'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'avatarLarge': instance.avatarLarge,
      'username': instance.username,
      'jobTitle': instance.jobTitle,
      'company': instance.company
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book_cell _$Book_cellFromJson(Map<String, dynamic> json) {
  return Book_cell()
    ..id = json['id'] as String
    ..lastSectionCount = json['lastSectionCount'] as num
    ..buyCount = json['buyCount'] as num
    ..img = json['img'] as String
    ..title = json['title'] as String
    ..price = json['price'] as num
    ..userData = json['userData'] == null
        ? null
        : User.fromJson(json['userData'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Book_cellToJson(Book_cell instance) => <String, dynamic>{
      'id': instance.id,
      'lastSectionCount': instance.lastSectionCount,
      'buyCount': instance.buyCount,
      'img': instance.img,
      'title': instance.title,
      'price': instance.price,
      'userData': instance.userData
    };

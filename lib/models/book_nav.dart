import 'package:json_annotation/json_annotation.dart';

part 'book_nav.g.dart';

@JsonSerializable()
class Book_nav {
    Book_nav();

    String name;
    String id;
    String alias;
    
    factory Book_nav.fromJson(Map<String,dynamic> json) => _$Book_navFromJson(json);
    Map<String, dynamic> toJson() => _$Book_navToJson(this);
}

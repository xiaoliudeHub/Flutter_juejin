import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'book_cell.g.dart';

@JsonSerializable()
class Book_cell {
    Book_cell();

    String id;
    num lastSectionCount;
    num buyCount;
    String img;
    String title;
    num price;
    User userData;
    
    factory Book_cell.fromJson(Map<String,dynamic> json) => _$Book_cellFromJson(json);
    Map<String, dynamic> toJson() => _$Book_cellToJson(this);
}

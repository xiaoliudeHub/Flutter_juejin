import 'package:json_annotation/json_annotation.dart';
import "user.dart";
import "topic_info.dart";
part 'pins_cell.g.dart';

@JsonSerializable()
class Pins_cell {
    Pins_cell();

    User user;
    String objectId;
    String uid;
    String content;
    List<String> pictures;
    num commentCount;
    num likedCount;
    String createdAt;
    String url;
    String urlTitle;
    String urlPic;
    Topic_info topic;
    
    factory Pins_cell.fromJson(Map<String,dynamic> json) => _$Pins_cellFromJson(json);
    Map<String, dynamic> toJson() => _$Pins_cellToJson(this);
}

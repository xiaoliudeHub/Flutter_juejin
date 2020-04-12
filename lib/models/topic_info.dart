import 'package:json_annotation/json_annotation.dart';

part 'topic_info.g.dart';

@JsonSerializable()
class Topic_info {
    Topic_info();

    String objectId;
    String title;
    
    factory Topic_info.fromJson(Map<String,dynamic> json) => _$Topic_infoFromJson(json);
    Map<String, dynamic> toJson() => _$Topic_infoToJson(this);
}

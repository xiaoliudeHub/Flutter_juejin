import 'package:json_annotation/json_annotation.dart';

part 'activity_nav.g.dart';

@JsonSerializable()
class Activity_nav {
    Activity_nav();

    String cityName;
    String cityAlias;
    
    factory Activity_nav.fromJson(Map<String,dynamic> json) => _$Activity_navFromJson(json);
    Map<String, dynamic> toJson() => _$Activity_navToJson(this);
}

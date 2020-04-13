import 'package:json_annotation/json_annotation.dart';

part 'activity_cell.g.dart';

@JsonSerializable()
class Activity_cell {
    Activity_cell();

    String screenshot;
    String eventlUrl;
    String title;
    String city;
    String startTime;
    
    factory Activity_cell.fromJson(Map<String,dynamic> json) => _$Activity_cellFromJson(json);
    Map<String, dynamic> toJson() => _$Activity_cellToJson(this);
}

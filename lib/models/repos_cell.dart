import 'package:json_annotation/json_annotation.dart';

part 'repos_cell.g.dart';

@JsonSerializable()
class Repos_cell {
    Repos_cell();

    String userName;
    String repoName;
    String language;
    num stars;
    num fork;
    String description;
    String time;
    String url;
    
    factory Repos_cell.fromJson(Map<String,dynamic> json) => _$Repos_cellFromJson(json);
    Map<String, dynamic> toJson() => _$Repos_cellToJson(this);
}

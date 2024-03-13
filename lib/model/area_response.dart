import 'package:json_annotation/json_annotation.dart';
import 'package:play/model/default_error_response.dart';
part 'area_response.g.dart';

@JsonSerializable()
class AreaResponse extends DefaultErrorResponse {
  @JsonKey(name: "area")
  Area? area;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "emblem")
  String? emblem;
  @JsonKey(name: "currentSeason")
  CurrentSeasonArea? currentSeasonArea;

  AreaResponse({
    this.area,
    this.id,
    this.name,
    this.code,
    this.type,
    this.emblem,
    this.currentSeasonArea,
  });

  factory AreaResponse.fromJson(Map<String, dynamic> json) =>
      _$AreaResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AreaResponseToJson(this);
}

@JsonSerializable()
class Area {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "flag")
  String? flag;
  Area({
    this.id,
    this.name,
    this.code,
    this.flag,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

@JsonSerializable()
class CurrentSeasonArea {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "startDate")
  String? startDate;
  @JsonKey(name: "endDate")
  String? endDate;
  @JsonKey(name: "currentMatchday")
  int? currentMatchday;
  @JsonKey(name: "winner")
  WinnerCurrentSeasonArea? winner;

  CurrentSeasonArea({
    this.id,
    this.startDate,
    this.endDate,
    this.currentMatchday,
    this.winner,
  });

  factory CurrentSeasonArea.fromJson(Map<String, dynamic> json) =>
      _$CurrentSeasonAreaFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentSeasonAreaToJson(this);
}

@JsonSerializable()
class WinnerCurrentSeasonArea {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "shortName")
  String? shortName;
  @JsonKey(name: "tla")
  String? tla;
  @JsonKey(name: "crest")
  String? crest;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "website")
  String? website;
  @JsonKey(name: "founded")
  int? founded;
  @JsonKey(name: "clubColors")
  String? clubColors;
  @JsonKey(name: "venue")
  String? venue;
  @JsonKey(name: "lastUpdated")
  String? lastUpdated;

  WinnerCurrentSeasonArea({
    this.id,
    this.name,
    this.shortName,
    this.tla,
    this.crest,
    this.address,
    this.website,
    this.founded,
    this.clubColors,
    this.venue,
    this.lastUpdated,
  });

  factory WinnerCurrentSeasonArea.fromJson(Map<String, dynamic> json) =>
      _$WinnerCurrentSeasonAreaFromJson(json);

  Map<String, dynamic> toJson() => _$WinnerCurrentSeasonAreaToJson(this);
}

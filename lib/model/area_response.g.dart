// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaResponse _$AreaResponseFromJson(Map<String, dynamic> json) => AreaResponse(
      area: json['area'] == null
          ? null
          : Area.fromJson(json['area'] as Map<String, dynamic>),
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      type: json['type'] as String?,
      emblem: json['emblem'] as String?,
      currentSeasonArea: json['currentSeason'] == null
          ? null
          : CurrentSeasonArea.fromJson(
              json['currentSeason'] as Map<String, dynamic>),
    )
      ..errorCode = json['errorCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AreaResponseToJson(AreaResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'message': instance.message,
      'area': instance.area,
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': instance.type,
      'emblem': instance.emblem,
      'currentSeason': instance.currentSeasonArea,
    };

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
    };

CurrentSeasonArea _$CurrentSeasonAreaFromJson(Map<String, dynamic> json) =>
    CurrentSeasonArea(
      id: json['id'] as int?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      currentMatchday: json['currentMatchday'] as int?,
      winner: json['winner'] == null
          ? null
          : WinnerCurrentSeasonArea.fromJson(
              json['winner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentSeasonAreaToJson(CurrentSeasonArea instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'currentMatchday': instance.currentMatchday,
      'winner': instance.winner,
    };

WinnerCurrentSeasonArea _$WinnerCurrentSeasonAreaFromJson(
        Map<String, dynamic> json) =>
    WinnerCurrentSeasonArea(
      id: json['id'] as int?,
      name: json['name'] as String?,
      shortName: json['shortName'] as String?,
      tla: json['tla'] as String?,
      crest: json['crest'] as String?,
      address: json['address'] as String?,
      website: json['website'] as String?,
      founded: json['founded'] as int?,
      clubColors: json['clubColors'] as String?,
      venue: json['venue'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
    );

Map<String, dynamic> _$WinnerCurrentSeasonAreaToJson(
        WinnerCurrentSeasonArea instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'tla': instance.tla,
      'crest': instance.crest,
      'address': instance.address,
      'website': instance.website,
      'founded': instance.founded,
      'clubColors': instance.clubColors,
      'venue': instance.venue,
      'lastUpdated': instance.lastUpdated,
    };

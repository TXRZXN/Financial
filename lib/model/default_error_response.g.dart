// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultErrorResponse _$DefaultErrorResponseFromJson(
        Map<String, dynamic> json) =>
    DefaultErrorResponse(
      errorCode: json['errorCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DefaultErrorResponseToJson(
        DefaultErrorResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'message': instance.message,
    };

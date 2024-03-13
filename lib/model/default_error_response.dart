import 'package:json_annotation/json_annotation.dart';
part 'default_error_response.g.dart';

@JsonSerializable()
class DefaultErrorResponse {
  @JsonKey(name: "errorCode")
  int? errorCode;
  @JsonKey(name: "message")
  String? message;

  DefaultErrorResponse({
    this.errorCode,
    this.message,
  });

  factory DefaultErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultErrorResponseToJson(this);
}

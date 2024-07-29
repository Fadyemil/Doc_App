import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

/// This class represents an error object returned by the API.
/// Instead of writing the fromJson and toJson functions manually for each class
/// , the tool generates them automatically.
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

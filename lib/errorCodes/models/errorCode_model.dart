import 'package:json_annotation/json_annotation.dart';

part 'errorCode_model.g.dart';

enum ErrorOriginEnum {
  @JsonValue("ONLY_ADVANCE")
  ONLY_ADVANCE,
  @JsonValue("ONLY_TERSE")
  ONLY_TERSE,
  @JsonValue("ADVANCE_TERSE")
  ADVANCE_TERSE,
}

@JsonSerializable()
class DescriptionType {
  final String english;
  final String persian;
  final String arabic;
  final String turkish;
  final String russian;
  final String german;

  DescriptionType({
    required this.english,
    required this.persian,
    required this.arabic,
    required this.turkish,
    required this.russian,
    required this.german,
  });

  factory DescriptionType.fromJson(Map<String, dynamic> json) =>
      _$DescriptionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionTypeToJson(this);
}

@JsonSerializable()
class MiniDescriptionType {
  final String english;
  final String persian;

  MiniDescriptionType({required this.english, required this.persian});

  factory MiniDescriptionType.fromJson(Map<String, dynamic> json) =>
      _$MiniDescriptionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$MiniDescriptionTypeToJson(this);
}

@JsonSerializable()
class ErrorCodeType {
  final String code;
  final ErrorOriginEnum origin;
  final String name;
  final DescriptionType description;
  final DescriptionType solution;
  final MiniDescriptionType additional_description_for_ai_assistant;

  ErrorCodeType({
    required this.code,
    required this.origin,
    required this.name,
    required this.description,
    required this.solution,
    required this.additional_description_for_ai_assistant,
  });

  factory ErrorCodeType.fromJson(Map<String, dynamic> json) =>
      _$ErrorCodeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorCodeTypeToJson(this);
}

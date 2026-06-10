// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errorCode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescriptionType _$DescriptionTypeFromJson(Map<String, dynamic> json) =>
    DescriptionType(
      english: json['english'] as String,
      persian: json['persian'] as String,
      arabic: json['arabic'] as String,
      turkish: json['turkish'] as String,
      russian: json['russian'] as String,
      german: json['german'] as String,
    );

Map<String, dynamic> _$DescriptionTypeToJson(DescriptionType instance) =>
    <String, dynamic>{
      'english': instance.english,
      'persian': instance.persian,
      'arabic': instance.arabic,
      'turkish': instance.turkish,
      'russian': instance.russian,
      'german': instance.german,
    };

MiniDescriptionType _$MiniDescriptionTypeFromJson(Map<String, dynamic> json) =>
    MiniDescriptionType(
      english: json['english'] as String,
      persian: json['persian'] as String,
    );

Map<String, dynamic> _$MiniDescriptionTypeToJson(
  MiniDescriptionType instance,
) => <String, dynamic>{
  'english': instance.english,
  'persian': instance.persian,
};

ErrorCodeType _$ErrorCodeTypeFromJson(Map<String, dynamic> json) =>
    ErrorCodeType(
      code: json['code'] as String,
      origin: $enumDecode(_$ErrorOriginEnumEnumMap, json['origin']),
      name: json['name'] as String,
      description: DescriptionType.fromJson(
        json['description'] as Map<String, dynamic>,
      ),
      solution: DescriptionType.fromJson(
        json['solution'] as Map<String, dynamic>,
      ),
      additional_description_for_ai_assistant: MiniDescriptionType.fromJson(
        json['additional_description_for_ai_assistant'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ErrorCodeTypeToJson(ErrorCodeType instance) =>
    <String, dynamic>{
      'code': instance.code,
      'origin': _$ErrorOriginEnumEnumMap[instance.origin]!,
      'name': instance.name,
      'description': instance.description,
      'solution': instance.solution,
      'additional_description_for_ai_assistant':
          instance.additional_description_for_ai_assistant,
    };

const _$ErrorOriginEnumEnumMap = {
  ErrorOriginEnum.ONLY_ADVANCE: 'ONLY_ADVANCE',
  ErrorOriginEnum.ONLY_TERSE: 'ONLY_TERSE',
  ErrorOriginEnum.ADVANCE_TERSE: 'ADVANCE_TERSE',
};

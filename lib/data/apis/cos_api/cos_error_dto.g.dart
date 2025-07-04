// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cos_error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CosErrorDTO _$CosErrorDTOFromJson(Map<String, dynamic> json) => CosErrorDTO(
      msgKey: json['msgKey'] as String,
      params: json['params'] as Map<String, dynamic>,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CosErrorDTOToJson(CosErrorDTO instance) =>
    <String, dynamic>{
      'msgKey': instance.msgKey,
      'params': instance.params,
      'message': instance.message,
    };

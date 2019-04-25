// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MatrixHead.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatrixHead _$MatrixHeadFromJson(Map<String, dynamic> json) {
  return MatrixHead(
      Message: json['Message'] as String,
      Code: json['Code'] as String,
      CallTime: json['CallTime'] as String);
}

Map<String, dynamic> _$MatrixHeadToJson(MatrixHead instance) =>
    <String, dynamic>{
      'Message': instance.Message,
      'Code': instance.Code,
      'CallTime': instance.CallTime
    };

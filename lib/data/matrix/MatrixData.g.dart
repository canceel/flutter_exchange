// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MatrixData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatrixData _$MatrixDataFromJson(Map<String, dynamic> json) {
  return MatrixData(
      head: json['Head'] == null
          ? null
          : MatrixHead.fromJson(json['Head'] as Map<String, dynamic>),
      result: (json['Result'] as List)
          ?.map((e) => e == null
              ? null
              : MatrixResult.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MatrixDataToJson(MatrixData instance) =>
    <String, dynamic>{'Head': instance.head, 'Result': instance.result};

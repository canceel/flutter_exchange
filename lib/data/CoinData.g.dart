// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoinData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinData _$CoinDataFromJson(Map<String, dynamic> json) {
  return CoinData(
      code: json['code'] as int,
      detailMsg: json['detailMsg'] as String,
      msg: json['msg'] as String,
      data: (json['data'] as List)
          ?.map((e) =>
              e == null ? null : CoinInfo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CoinDataToJson(CoinData instance) => <String, dynamic>{
      'code': instance.code,
      'detailMsg': instance.detailMsg,
      'msg': instance.msg,
      'data': instance.data
    };

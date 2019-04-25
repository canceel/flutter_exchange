// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoinDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetail _$CoinDetailFromJson(Map<String, dynamic> json) {
  return CoinDetail(
      CoinMarketCapId: json['CoinMarketCapId'] as String,
      Symbol: json['Symbol'] as String,
      FullName: json['FullName'] as String,
      Icon: json['Icon'] as String,
      IssueDateTime: json['IssueDateTime'] as String,
      WebSite: json['WebSite'] as String,
      Introduction: json['Introduction'] as String,
      PlatformName: json['PlatformName'] as String,
      CoinId: json['CoinId'] as int,
      CurrentSupplyValue: json['CurrentSupplyValue'] as double,
      MaxSupplyValue: json['MaxSupplyValue'] as double,
      CurrentCirculation: json['CurrentCirculation'] as double,
      ExchangeIds:
          (json['ExchangeIds'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$CoinDetailToJson(CoinDetail instance) =>
    <String, dynamic>{
      'CoinMarketCapId': instance.CoinMarketCapId,
      'Symbol': instance.Symbol,
      'FullName': instance.FullName,
      'Icon': instance.Icon,
      'IssueDateTime': instance.IssueDateTime,
      'WebSite': instance.WebSite,
      'Introduction': instance.Introduction,
      'PlatformName': instance.PlatformName,
      'CoinId': instance.CoinId,
      'CurrentSupplyValue': instance.CurrentSupplyValue,
      'MaxSupplyValue': instance.MaxSupplyValue,
      'CurrentCirculation': instance.CurrentCirculation,
      'ExchangeIds': instance.ExchangeIds
    };

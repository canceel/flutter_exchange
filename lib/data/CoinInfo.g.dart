// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoinInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinInfo _$CoinInfoFromJson(Map<String, dynamic> json) {
  return CoinInfo(
      buy: json['buy'] as String,
      change: json['change'] as String,
      changePercentage: json['changePercentage'] as String,
      close: json['close'] as String,
      coinVolume: json['coinVolume'] as String,
      currencyId: json['currencyId'] as String,
      dayHigh: json['dayHigh'] as String,
      dayLow: json['dayLow'] as String,
      high: json['high'] as String,
      inflows: json['inflows'] as String,
      last: json['last'] as String,
      low: json['low'] as String,
      open: json['open'] as String,
      outflows: json['outflows'] as String,
      sell: json['sell'] as String,
      symbol: json['symbol'] as String,
      volume: json['volume'] as String,
      brokerId: json['brokerId'] as int,
      marketFrom: json['marketFrom'] as int,
      productId: json['productId'] as int,
      createdDate: json['createdDate'] as num);
}

Map<String, dynamic> _$CoinInfoToJson(CoinInfo instance) => <String, dynamic>{
      'buy': instance.buy,
      'change': instance.change,
      'changePercentage': instance.changePercentage,
      'close': instance.close,
      'coinVolume': instance.coinVolume,
      'currencyId': instance.currencyId,
      'dayHigh': instance.dayHigh,
      'dayLow': instance.dayLow,
      'high': instance.high,
      'inflows': instance.inflows,
      'last': instance.last,
      'low': instance.low,
      'open': instance.open,
      'outflows': instance.outflows,
      'sell': instance.sell,
      'symbol': instance.symbol,
      'volume': instance.volume,
      'brokerId': instance.brokerId,
      'marketFrom': instance.marketFrom,
      'productId': instance.productId,
      'createdDate': instance.createdDate
    };

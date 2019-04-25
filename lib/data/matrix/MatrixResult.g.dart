// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MatrixResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatrixResult _$MatrixResultFromJson(Map<String, dynamic> json) {
  return MatrixResult(
      icon: json['icon'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      time: json['time'] as String,
      priceUsd: (json['price_usd'] as num)?.toDouble(),
      usdPercentChange1h: (json['usd_percent_change_1h'] as num)?.toDouble(),
      priceBtc: (json['price_btc'] as num)?.toDouble(),
      btcPercentChange1h: (json['btc_percent_change_1h'] as num)?.toDouble(),
      coinId: json['coin_id'] as int,
      marketcap: (json['marketcap'] as num)?.toDouble(),
      usdPercentChange24h: (json['usd_percent_change_24h'] as num)?.toDouble(),
      usdPercentChange7d: (json['usd_percent_change_7d'] as num)?.toDouble(),
      usdVolume24h: (json['usd_volume_24h'] as num)?.toDouble(),
      marketcapBtc: (json['marketcap_btc'] as num)?.toDouble(),
      btcPercentChange24h: (json['btc_percent_change_24h'] as num)?.toDouble(),
      btcPercentChange7d: (json['btc_percent_change_7d'] as num)?.toDouble(),
      btcVolume24h: (json['btc_volume_24h'] as num)?.toDouble());
}

Map<String, dynamic> _$MatrixResultToJson(MatrixResult instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'time': instance.time,
      'price_usd': instance.priceUsd,
      'usd_percent_change_1h': instance.usdPercentChange1h,
      'usd_percent_change_24h': instance.usdPercentChange24h,
      'usd_percent_change_7d': instance.usdPercentChange7d,
      'usd_volume_24h': instance.usdVolume24h,
      'price_btc': instance.priceBtc,
      'coin_id': instance.coinId,
      'marketcap': instance.marketcap,
      'marketcap_btc': instance.marketcapBtc,
      'btc_percent_change_1h': instance.btcPercentChange1h,
      'btc_percent_change_24h': instance.btcPercentChange24h,
      'btc_percent_change_7d': instance.btcPercentChange7d,
      'btc_volume_24h': instance.btcVolume24h
    };

import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'MatrixResult.g.dart';

@JsonSerializable()
class MatrixResult{
  String icon;
  String id;
  String name;
  String symbol;
  String time;
  @JsonKey(name: 'price_usd')
  double priceUsd;
  @JsonKey(name: 'usd_percent_change_1h')
  double usdPercentChange1h;
  @JsonKey(name: 'usd_percent_change_24h')
  double usdPercentChange24h;
  @JsonKey(name: 'usd_percent_change_7d')
  double usdPercentChange7d;
  @JsonKey(name: 'usd_volume_24h')
  double usdVolume24h;
  @JsonKey(name: 'price_btc')
  double priceBtc;
  @JsonKey(name: 'coin_id')
  int coinId;
  double marketcap;
  @JsonKey(name: 'marketcap_btc')
  double marketcapBtc;
  @JsonKey(name: 'btc_percent_change_1h')
  double btcPercentChange1h;
  @JsonKey(name: 'btc_percent_change_24h')
  double btcPercentChange24h;
  @JsonKey(name: 'btc_percent_change_7d')
  double btcPercentChange7d;
  @JsonKey(name: 'btc_volume_24h')
  double btcVolume24h;

  MatrixResult(
      {this.icon,
      this.id,
      this.name,
      this.symbol,
      this.time,
      this.priceUsd,
      this.usdPercentChange1h,
      this.priceBtc,
      this.btcPercentChange1h,
      this.coinId,
      this.marketcap,
      this.usdPercentChange24h,
      this.usdPercentChange7d,
      this.usdVolume24h,
      this.marketcapBtc,
      this.btcPercentChange24h,
      this.btcPercentChange7d,
      this.btcVolume24h});

  factory MatrixResult.fromJson(Map<String, dynamic> json) => _$MatrixResultFromJson(json);
  Map<String, dynamic> toJson() => _$MatrixResultToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'CoinInfo.g.dart';
@JsonSerializable()
class CoinInfo {
  String buy;
  String change;
  String changePercentage;
  String close;
  String coinVolume;
  String currencyId;
  String dayHigh;
  String dayLow;
  String high;
  String inflows;
  String last;
  String low;
  String open;
  String outflows;
  String sell;
  String symbol;
  String volume;
  int brokerId;
  int marketFrom;
  int productId;
  num createdDate;

  CoinInfo(
      {this.buy,
        this.change,
        this.changePercentage,
        this.close,
        this.coinVolume,
        this.currencyId,
        this.dayHigh,
        this.dayLow,
        this.high,
        this.inflows,
        this.last,
        this.low,
        this.open,
        this.outflows,
        this.sell,
        this.symbol,
        this.volume,
        this.brokerId,
        this.marketFrom,
        this.productId,
        this.createdDate});

  factory CoinInfo.fromJson(Map<String, dynamic> json) => _$CoinInfoFromJson(json);
  Map<String, dynamic> toJson() => _$CoinInfoToJson(this);
}
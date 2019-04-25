import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'CoinDetail.g.dart';

@JsonSerializable()
class CoinDetail {
  String CoinMarketCapId;
  String Symbol;
  String FullName;
  String Icon;
  String IssueDateTime;
  String WebSite;
  String Introduction;
  String PlatformName;
  int CoinId;
  double CurrentSupplyValue;
  double MaxSupplyValue;
  double CurrentCirculation;
  List<int> ExchangeIds;

  CoinDetail(
      {this.CoinMarketCapId,
      this.Symbol,
      this.FullName,
      this.Icon,
      this.IssueDateTime,
      this.WebSite,
      this.Introduction,
      this.PlatformName,
      this.CoinId,
      this.CurrentSupplyValue,
      this.MaxSupplyValue,
      this.CurrentCirculation,
      this.ExchangeIds});

  factory CoinDetail.fromJson(Map<String, dynamic> json) => _$CoinDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CoinDetailToJson(this);
}

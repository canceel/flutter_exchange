import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_exchange/data/CoinInfo.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'CoinData.g.dart';

@JsonSerializable()
class CoinData {
  int code;
  String detailMsg;
  String msg;
  List<CoinInfo> data;

  CoinData({this.code, this.detailMsg, this.msg, this.data});

  factory CoinData.fromJson(Map<String, dynamic> json) => _$CoinDataFromJson(json);
  Map<String, dynamic> toJson() => _$CoinDataToJson(this);
}

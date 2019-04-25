import 'package:flutter_exchange/data/matrix/MatrixHead.dart';
import 'package:flutter_exchange/data/matrix/MatrixResult.dart';
import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'MatrixData.g.dart';

@JsonSerializable()
class MatrixData{
  @JsonKey(name: 'Head')
  MatrixHead head;
  @JsonKey(name: 'Result')
  List<MatrixResult> result;

  MatrixData({this.head, this.result});

  factory MatrixData.fromJson(Map<String, dynamic> json) => _$MatrixDataFromJson(json);
  Map<String, dynamic> toJson() => _$MatrixDataToJson(this);
}
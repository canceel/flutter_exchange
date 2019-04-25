import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'MatrixHead.g.dart';

@JsonSerializable()
class MatrixHead {
  String Message;
  String Code;
  String CallTime;

  MatrixHead({this.Message, this.Code, this.CallTime});

  factory MatrixHead.fromJson(Map<String, dynamic> json) => _$MatrixHeadFromJson(json);
  Map<String, dynamic> toJson() => _$MatrixHeadToJson(this);

}

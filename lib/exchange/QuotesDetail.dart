import 'package:flutter/material.dart';
import 'package:flutter_exchange/data/CoinInfo.dart';
//TODO 币种详情K线等数据
class QUotesDetail extends StatefulWidget {
  const QUotesDetail({Key key, this.coinInfo})
      : assert(coinInfo != null),
        super(key: key);
  final CoinInfo coinInfo;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QUotesDetailState();
  }
}

class QUotesDetailState extends State<QUotesDetail> {
  @override
  Widget build(BuildContext context) {
    var coinInfo=widget.coinInfo;
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Center(
          child: Text("${coinInfo.symbol}(全网)"),
        ),
      ),
      body:new  Center(
        child: Column(
          children: <Widget>[
            Text("${coinInfo.symbol}"),
            new Text("TODO 币种详情K线等数据"),
          ],
        ),
      ),
    );
  }
}

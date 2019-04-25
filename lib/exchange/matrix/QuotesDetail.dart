import 'package:flutter/material.dart';
import 'package:flutter_exchange/data/matrix/MatrixResult.dart';
import 'package:flutter_exchange/utils/HttpCore.dart';
import 'package:flutter_exchange/contants/Api.dart';
import 'package:flutter_exchange/data/matrix/CoinDetail.dart';

//TODO 币种详情K线等数据
class QuotesDetail extends StatefulWidget {
  const QuotesDetail({Key key, this.matrixResult})
      : assert(matrixResult != null),
        super(key: key);
  final MatrixResult matrixResult;

  @override
  State<StatefulWidget> createState() {
    return QuotesDetailState();
  }
}

class QuotesDetailState extends State<QuotesDetail> {
  var params;

  void getDetailInfo() {
    HttpCore.instance.get(Api.CCOIN_BASE_INFO, (data) {
      setState(() {
        coinDetail = CoinDetail.fromJson(data["Result"][0]);
//        print(coinDetail.toString());
      });
    }, errorCallBack: (error) {
      print(error.toString());
    }, params: params);
  }

  MatrixResult matrixResult;
  CoinDetail coinDetail;

  @override
  void initState() {
    matrixResult = widget.matrixResult;
    params = Map<String, String>();
    params["Params.CoinId"] = "${matrixResult.coinId}";
    getDetailInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Center(
          child: Text("${matrixResult.symbol}(全网)"),
        ),
      ),
      body: new Center(
        child: ListView(
          children: <Widget>[
            topDetail(),
            new Container(
              height: 1,
              margin: EdgeInsets.only(top: 15),
              color: Colors.grey[300],
            ),
            coinInfo("总市值", "${coinDetail?.CoinMarketCapId}"),
            coinInfo("市值排名", "${coinDetail?.CoinId}"),
            coinInfo("流通总量", "${coinDetail?.CurrentCirculation}"),
            coinInfo("发行总量", "${coinDetail?.CurrentSupplyValue}"),
            coinInfo("ICO价格", "${coinDetail?.CoinMarketCapId}"),
            coinInfo("发行时间", "${coinDetail?.IssueDateTime}"),
            coinInfo("官方网站", "${coinDetail?.WebSite}"),
            new Container(
              height: 10,
              margin: EdgeInsets.only(top: 15),
              color: Colors.grey[300],
            ),
            _Introduction(coinDetail?.FullName, "${coinDetail?.Introduction}"),
            new Container(
              height: 10,
              margin: EdgeInsets.only(top: 15),
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }

  Widget topDetail() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text("${matrixResult.priceUsd}"),
              new Icon(
                _formateIcon(matrixResult.usdPercentChange24h.toString()),
                color:
                    formateColor(matrixResult.usdPercentChange24h.toString()),
              ),
              new Text(
                "${matrixResult.usdPercentChange24h}%",
                style: TextStyle(
                    color: formateColor(
                        matrixResult.usdPercentChange24h.toString())),
              ),
              new Expanded(
                  child: new Container(
                alignment: Alignment.centerRight,
                child: new IconButton(
                  color: Colors.grey,
                  icon: new Icon(Icons.star_border),
                  onPressed: () => {
                  _showSnackBar(context, "sdasd")
                  },
                ),
              ))
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text("≈${matrixResult.priceUsd}"),
              new Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text(
                      "最高:${matrixResult.priceUsd}",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text("24H成交额:${matrixResult.usdVolume24h}"),
              new Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text(
                      "最低:${matrixResult.priceUsd}",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget coinInfo(String title, String value) {
    return new Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(title),
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  value,
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //是否显示简介
  bool _isShowIntroduction = true;

  Widget _Introduction(String coinName, String introduction) {
    return new Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text("$coinName简介"),
                new Expanded(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: new Text(
                            _isShowIntroduction ? "隐藏" : "展开",
                            style: TextStyle(color: Colors.deepPurpleAccent),
                          ),
                        ),
                        onTap: () => isShowIntroduction(),
                      )
                    ],
                  ),
                )
              ],
            ),
            new Offstage(
              offstage:!_isShowIntroduction ,
              child:
              new Text(introduction),
            )
          ],
        ));
  }

  isShowIntroduction() {
    setState(() {
      print(_isShowIntroduction.toString());
      _isShowIntroduction = !_isShowIntroduction;
    });
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: new Text(text)));
  }

  IconData _formateIcon(String value) {
    var icon = Icons.arrow_downward;
    if (value.isNotEmpty) {
      if (value.startsWith("-")) {
        icon = Icons.arrow_downward;
      } else {
        icon = Icons.arrow_upward;
      }
    }
    return icon;
  }

  Color formateColor(String value) {
    var color = Colors.grey[400];
    if (value.isNotEmpty) {
      if (value.startsWith("-")) {
        color = Colors.green;
      } else if (value == "0") {
        color = Colors.grey[400];
      } else {
        color = Colors.red;
      }
    }
    return color;
  }
}

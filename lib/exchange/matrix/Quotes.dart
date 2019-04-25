import 'package:flutter/material.dart';
import 'package:flutter_exchange/data/matrix/MatrixResult.dart';
import 'package:flutter_exchange/exchange/matrix/QuotesDetail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Quotes extends StatefulWidget {
  const Quotes({
    Key key,
    this.matrixResult,
    this.slidableController,
  })  : assert(matrixResult != null),
        super(key: key);
  final MatrixResult matrixResult;
  final SlidableController slidableController;

  @override
  State<StatefulWidget> createState() {
    return QuotesState();
  }
}

class QuotesState extends State<Quotes> {
  MatrixResult matrixResult;
  SlidableController slidableController;

  @override
  Widget build(BuildContext context) {
    matrixResult = widget.matrixResult;
    slidableController = widget.slidableController;
    return _getSlidableWithLists(context);
  }

  Widget _getSlidableWithLists(BuildContext context) {
    return new Slidable(
      key: new Key(matrixResult.symbol),
      controller: slidableController,
      direction: Axis.horizontal,
      delegate: SlidableStrechDelegate(),
      actionExtentRatio: 0.25,
      child: _QuotesItem(),
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: 'star',
          color: Colors.red,
          icon: Icons.star,
          onTap: () => _showSnackBar(context, 'star'),
        ),
        new IconSlideAction(
          caption: 'style',
          color: Colors.yellow,
          icon: Icons.style,
          onTap: () => _showSnackBar(context, 'style'),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: new Text(text)));
  }

  Widget _QuotesItem() {
    return new GestureDetector(
      onTap: () =>
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return QuotesDetail(matrixResult: matrixResult);
          })),
      child: Container(
        height: 60,
        margin: EdgeInsets.only(bottom: 1),
        padding: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new Row(
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text(
                          getCoinName1(matrixResult.symbol),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        new Text(
                          " / ${getCoinName2(matrixResult.symbol)}",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    new Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "成交量${formateValue(matrixResult.marketcap.toString())}",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                new Expanded(
                    child: new Container(
                  padding: EdgeInsets.only(right: 10),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        matrixResult.marketcap.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: formateColor(
                                matrixResult.usdPercentChange24h.toString())),
                      ),
                      Text(
                        "¥_",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            )),
            Container(
                color:
                    formateColor(matrixResult.usdPercentChange24h.toString()),
                height: 30,
                width: 70,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  "${matrixResult.usdPercentChange24h}%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  String formateName(String value) {
    var result = value;
    if (value.contains("_")) {
      result = value.replaceAll("_", " / ").toUpperCase();
    }
    return result;
  }

  String getCoinName1(String value) {
    var result = value;
    if (value.contains("_")) {
      result = value.substring(0, value.indexOf("_")).toUpperCase();
    }
    return result;
  }

  String getCoinName2(String value) {
    var result = "";
    if (value.contains("_")) {
      result = value.substring(value.indexOf("_") + 1).toUpperCase();
    }
    return result;
  }

  String formateValue(String value) {
    var result = value;
    if (value.contains(".")) {
      result = value.substring(0, value.indexOf("."));
    }
    return result;
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

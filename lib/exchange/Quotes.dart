import 'package:flutter/material.dart';
import 'package:flutter_exchange/data/CoinInfo.dart';
import 'package:flutter_exchange/exchange/QuotesDetail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Quotes extends StatefulWidget {
  const Quotes({
    Key key,
    this.coinInfo,
  })  : assert(coinInfo != null),
        super(key: key);
  final CoinInfo coinInfo;

  @override
  State<StatefulWidget> createState() {
    return QuotesState();
  }
}

class QuotesState extends State<Quotes> {
  SlidableController slidableController;

  @override
  void initState() {
    slidableController = new SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
    super.initState();
  }

  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.blue;

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    setState(() {
      _fabColor = isOpen ? Colors.green : Colors.blue;
    });
  }

  CoinInfo coinInfo;

  @override
  Widget build(BuildContext context) {
    coinInfo = widget.coinInfo;
    return  _getSlidableWithLists(context);
  }

  Widget _getSlidableWithLists(BuildContext context) {
    return new Slidable(
      key: new Key(coinInfo.symbol),
      direction: Axis.horizontal,
      slideToDismissDelegate: new SlideToDismissDrawerDelegate(
        closeOnCanceled: false,
        onDismissed: (actionType) {
          _showSnackBar(
              context,
              actionType == SlideActionType.primary
                  ? 'Dismiss Archive'
                  : 'Dimiss Delete');
        },
      ),
      delegate: SlidableBehindDelegate(),
      actionExtentRatio: 0.25,
      child: _QuotesItem(),
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: 'Collection',
          color: Colors.red,
          icon: Icons.star,
          onTap: () => _showSnackBar(context, 'Collection'),
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
            return QUotesDetail(coinInfo: coinInfo);
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
                          getCoinName1(coinInfo.symbol),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        new Text(
                          " / ${getCoinName2(coinInfo.symbol)}",
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
                        "成交量${formateValue(coinInfo.volume)}",
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
                        coinInfo.last,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: formateColor(coinInfo.changePercentage)),
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
                color: formateColor(coinInfo.changePercentage),
                height: 30,
                width: 70,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  coinInfo.changePercentage,
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
      } else if (value.startsWith("+")) {
        color = Colors.red;
      } else {
        color = Colors.grey[400];
      }
    }
    return color;
  }
}

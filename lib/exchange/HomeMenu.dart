import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeMenuState();
  }
}

class HomeMenuState extends State<HomeMenu>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      color: Colors.lightBlue[50],
      height: 35,
      child: new Row(
        children: <Widget>[
          Text(
            "币种",
            style: TextStyle(
                color: Colors.grey[500], fontWeight: FontWeight.w600),
          ),
          new Expanded(
              child: new Container(
                padding: EdgeInsets.only(right: 25),
                child: Text(
                  "最新价",
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.w600),
                  textAlign: TextAlign.end,
                ),
              )),
          Text(
            "24H涨跌",
            style: TextStyle(
                color: Colors.grey[500], fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_exchange/index.dart';
import 'package:flutter_exchange/exchange/matrix/QuotesDetail.dart';
import 'package:flutter_exchange/data/matrix/MatrixResult.dart';
import 'dart:ui';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: _widgetForRoute(window.defaultRouteName),
    );
  }
}

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'index':
      return MyIndex();
    case 'quotes_detail':
      return QuotesDetail(matrixResult: MatrixResult(coinId: 1,symbol: "BTC") ,);
    default:
      return MyIndex();
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_exchange/data/matrix/MatrixData.dart';
import 'package:flutter_exchange/utils/HttpCore.dart';
import 'package:flutter_exchange/contants/Api.dart';
import 'package:flutter_exchange/exchange/matrix/Quotes.dart';
import 'package:flutter_exchange/exchange/HomeMenu.dart';
import 'package:flutter_exchange/exchange/matrix/QuotesDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '行情'),
      routes: <String, WidgetBuilder>{ // 路由
      '/quotesDetail': (BuildContext context) => new QUotesDetail()
    },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentData = "init";

  void _incrementCounter() {
    setState(() {
      refreshDataFromNet();
    });
  }

  @override
  void initState() {
    refreshDataFromNet();
  }

  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[HomeMenu(), new Expanded(child: exchangeItem())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.threesixty),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  var datas;
  void refreshDataFromNet() {
    HttpCore.instance.get(Api.tickers, (data) {
      countDown();
      setState(() {
        datas = MatrixData.fromJson(data).result;
        print( MatrixData.fromJson(data).result[0].usdPercentChange24h);
      });
    }, errorCallBack: (error) {
      print(error.toString());
    });
  }

  Widget exchangeItem() {
    if (datas == null) {
      return Center(
        child: Text("交易行情"),
      );
    }
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: datas.length,
        itemBuilder: (context, index) => Container(
              child: Quotes(matrixResult: datas[index]),
            ));
  }

  void countDown() {
//    var _duration = new Duration(seconds: 1);
//    new Future.delayed(_duration, refreshDataFromNet);
  }
}

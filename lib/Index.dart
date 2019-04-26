import 'package:flutter/material.dart';
import 'package:flutter_exchange/data/matrix/MatrixData.dart';
import 'package:flutter_exchange/utils/HttpCore.dart';
import 'package:flutter_exchange/contants/Api.dart';
import 'package:flutter_exchange/exchange/matrix/Quotes.dart';
import 'package:flutter_exchange/exchange/HomeMenu.dart';
import 'package:flutter_exchange/exchange/matrix/QuotesDetail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(MyIndex());

class MyIndex extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '行情'),
      routes: <String, WidgetBuilder>{
        // 路由
        '/quotesDetail': (BuildContext context) => new QuotesDetail()
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

SlidableController slidableController;

class _MyHomePageState extends State<MyHomePage> {
  String currentData = "init";

  @override
  void initState() {
    slidableController = new SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
    refreshDataFromNet();
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

  void _incrementCounter() {
    setState(() {
      refreshDataFromNet();
    });
  }

  var mContext;

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
        backgroundColor: _fabColor,
        tooltip: 'Increment',
        child: _rotationAnimation == null
            ? Icon(Icons.threesixty)
            : RotationTransition(
                turns: _rotationAnimation,
                child: Icon(Icons.threesixty),
              ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  var datas;

  void refreshDataFromNet() {
    HttpCore.instance.get(Api.tickers, (data) {
      countDown();
      setState(() {
        datas = MatrixData.fromJson(data).result;
        print(MatrixData.fromJson(data).result[0].usdPercentChange24h);
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
              child: Quotes(
                matrixResult: datas[index],
                slidableController: slidableController,
              ),
            ));
  }

  void countDown() {
//    var _duration = new Duration(seconds: 3);
//    new Future.delayed(_duration, refreshDataFromNet);
  }
}



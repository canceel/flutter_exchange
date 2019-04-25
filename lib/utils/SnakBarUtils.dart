import 'package:flutter/material.dart';

class SnakBarUtils extends StatefulWidget {
  const SnakBarUtils({
    Key key,
    this.content,
  })  : assert(content != null),
        super(key: key);
  final String content;

  @override
  State<StatefulWidget> createState() {
    return SnakBarUtilsState();
  }
}

class SnakBarUtilsState extends State<SnakBarUtils> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Builder(
      builder: (BuildContext context) {
        return new RepaintBoundary(
          child: new Center(
            child: new GestureDetector(
              onTap: () {
              },
            ),
          ),
        );
      },
    );
  }
}

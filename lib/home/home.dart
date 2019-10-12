import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageLayout();
  }
}

class HomePageLayout extends State<HomePage> {
  bool _isHide = false;

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      shrinkWrap: true,
      // 内容
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(0),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                new _topLayout(_isHide, "70036.00", "1560.68", "71598.77", () {
                  setState(() {
                    _isHide = !_isHide;
                  });
                }),
                const Text('B'),
                const Text('C'),
                const Text('D'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _topLayout extends StatelessWidget {
  String _lendNum;
  String _expectNum;
  String _totalNum;
  VoidCallback _callback;
  bool isHide;

  _topLayout(this.isHide, this._lendNum, this._expectNum, this._totalNum,
      this._callback);

  String _hideString(String str) {
    return isHide ? ("*" * str.length) : str;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 360,
      color: Colors.yellow,
      child: Stack(children: <Widget>[
        new Align(
          alignment: Alignment.topLeft,
          child: new Container(
            padding: EdgeInsets.fromLTRB(24, 60, 0, 0),
            height: 240,
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Text("出借本金(元)", style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_red_eye,
                          size: 20, color: Colors.white),
                      onPressed: _callback,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                new Text(_hideString(_lendNum),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(
                  height: 4,
                ),
                new Row(
                  children: <Widget>[
                    new Text("参考未到期受益（元）",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(
                      width: 6,
                    ),
                    new Text(_hideString(_expectNum),
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                new Row(
                  children: <Widget>[
                    new Text("参考总资产（元）",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(
                      width: 6,
                    ),
                    new Text(_hideString(_totalNum),
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ),
        new Align(
          alignment: Alignment.bottomLeft,
          child: new Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
            height: 150,
            // color: Colors.pink,
          ),
        )
      ]),
      // child:
    );
  }
}

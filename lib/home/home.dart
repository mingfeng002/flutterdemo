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
                new _topLayout(_isHide, "70037.00", "1560.68", "71598.77", () {
                  setState(() {
                    _isHide = !_isHide;
                  });
                }),
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

//class _topLayout extends StatefulWidget {
//  String _lendNum;
//  String _expectNum;
//  String _totalNum;
//  VoidCallback _callback;
//  bool isHide;
//
//  _topLayout(this.isHide, this._lendNum, this._expectNum, this._totalNum,
//      this._callback);
//
//  @override
//  State<StatefulWidget> createState() {
//    return new _topLayoutState(this.isHide, this._lendNum, this._expectNum,
//        this._totalNum, this._callback);
//  }
//}

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
    return Container(
      height: 360,
      color: Colors.yellow,
      child: Stack(children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 60, 0, 0),
            height: 240,
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("出借本金(元)", style: TextStyle(color: Colors.white)),
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
                Text(_hideString(_lendNum),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: <Widget>[
                    Text("参考未到期受益（元）",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(
                      width: 6,
                    ),
                    Text(_hideString(_expectNum),
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: <Widget>[
                    Text("参考总资产（元）",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(
                      width: 6,
                    ),
                    Text(_hideString(_totalNum),
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
            height: 100,
            child: Carroussel(),
            // color: Colors.pink,
          ),
        )
      ]),
      // child:
    );
  }
}

class Carroussel extends StatefulWidget {
  @override
  _CarrousselState createState() => new _CarrousselState();
}

class _CarrousselState extends State<Carroussel> {
  PageController controller;
  int currentpage = 1;
  List _pages=[new Container(color: Colors.pink,),new Container(color: Colors.blue,),
    new Container(color: Colors.yellowAccent,),new Container(color: Colors.cyan,)];

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
          child: new PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentpage = value;
                });
              },
              controller: controller,
              itemBuilder: (context, index) => builder(index)),
        ),
      ),
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }
        return new Center(
          child: new SizedBox(
            height: Curves.easeOut.transform(value) * 100,
//            width: Curves.easeOut.transform(value) * 200,
            width: 170,
            child: child,
          ),
        );
      },
      child: _pages[index%_pages.length],
    );
  }
}

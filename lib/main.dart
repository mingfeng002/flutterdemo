import 'package:flutter/material.dart';

import 'home/dynamic.dart';
import 'home/home.dart';
import 'home/loan.dart';
import 'home/my.dart';


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
      home: new Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DemoT();
  }
}

class DemoT extends State<Demo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new TabPage3Layout();
  }
}

class TabPage3Layout extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new TabPage3();
  }

}

class TabPage3 extends State<TabPage3Layout>{
  int _currentIndex=0;
  List<Widget> pages=[new HomePage(),new LoanPage(),new DynamicPage(),new MyPage()];
  @override
  Widget build(BuildContext context) {

    _onBottomTabChange(int index) {
      setState(() {
        _currentIndex=index;
      });
    }
    return new Scaffold(

     body: new Container(
       alignment: Alignment.center,
       child: pages[_currentIndex],
     ),
      bottomNavigationBar: BottomNavigationBar(
        //不设置该属性多于三个不显示颜色
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.reorder), title: Text("出借")),
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), title: Text("动态")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的"))
        ],
         currentIndex: _currentIndex,
//        fixedColor: Colors.blue,s
        onTap: (index) => _onBottomTabChange(index),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class MyPage extends StatefulWidget{
  //String msg;
  //HomePage(this.msg);
  @override
  State<StatefulWidget> createState() {

    return new MyPageLayout();
  }

}

class MyPageLayout extends State<MyPage>{
 // String msg;
 // HomePageLayout(this.msg);
  @override
  Widget build(BuildContext context) {

    return new Text("MyPage");
  }

}
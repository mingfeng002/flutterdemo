import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  //String msg;
  //HomePage(this.msg);
  @override
  State<StatefulWidget> createState() {

    return new HomePageLayout();
  }

}

class HomePageLayout extends State<HomePage>{
 // String msg;
 // HomePageLayout(this.msg);
  @override
  Widget build(BuildContext context) {

    return new Text("home");
  }

}
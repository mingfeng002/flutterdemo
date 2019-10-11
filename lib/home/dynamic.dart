import 'package:flutter/material.dart';

class DynamicPage extends StatefulWidget{
  //String msg;
  //HomePage(this.msg);
  @override
  State<StatefulWidget> createState() {

    return new DynamicPageLayout();
  }

}

class DynamicPageLayout extends State<DynamicPage>{
 // String msg;
 // HomePageLayout(this.msg);
  @override
  Widget build(BuildContext context) {

    return new Text("DynamicPage");
  }

}
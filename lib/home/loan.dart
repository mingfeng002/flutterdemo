import 'package:flutter/material.dart';

class LoanPage extends StatefulWidget{
//  String msg;
//  LoanPage(this.msg);
  @override
  State<StatefulWidget> createState() {

    return new LoanPageLayout();
  }

}

class LoanPageLayout extends State<LoanPage>{
//  String msg;
//  LoanPageLayout(this.msg);
  @override
  Widget build(BuildContext context) {

    return new Text("loan");
  }

}
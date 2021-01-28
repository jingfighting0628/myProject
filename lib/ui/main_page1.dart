import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ui/HomePage1.dart';
import 'package:flutter_app/ui/workPage.dart';
import 'package:flutter_app/ui/projectPage.dart';
import 'package:flutter_app/ui/MinePage.dart';
class mainPage1 extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _mainPage1State();
  }

}
class _mainPage1State extends State<mainPage1> {

  int currentIndex;
  final pages = [HomePage1(), workPage(), projectPage(), MinePage()];
  List titles = ["首页", "工作", "工程", "我"];
  List normalImgUrls = [
    "images/home.png",
    "images/work.png",
    "images/project.png",
    "images/Mine.png"];
  List selectedImgUrls = [
    "images/home_selected.png",
    "images/work_selected.png",
    "images/project_selected.png",
    "Mine_selected.png",
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('123'),
    );
  }
}


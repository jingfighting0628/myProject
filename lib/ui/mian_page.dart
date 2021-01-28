

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/strings.dart';
import 'package:flutter_app/ui/homePage.dart';
import 'package:flutter_app/ui/mian_page.dart';
import 'package:flutter_app/ui/workPage.dart';
import 'package:flutter_app/ui/projectPage.dart';
import 'package:flutter_app/ui/MinePage.dart';
import 'package:flutter_app/ui/HomePage1.dart';
class _Page {
  final String labelId ;
  _Page(this.labelId);
  
}
final List _allPages = [

  HomePage1(),
  workPage(),
  projectPage(),
  MinePage()
  
];


final List<BottomNavigationBarItem> items = [

  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label:'首页',
    backgroundColor: Colors.blue,

  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '工作',
    backgroundColor: Colors.blue,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.work),
    label: '工程',
    backgroundColor: Colors.blue,


  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.work),
    label: '我',
      backgroundColor: Colors.blue,
  )

];


class MainPage extends StatefulWidget
{
 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
  
}
class _MainPageState extends State<MainPage>{

  var  currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: _allPages.length ,
      child: Scaffold(
        appBar: null,

        bottomNavigationBar:BottomNavigationBar(

          items: items,
          currentIndex: currentIndex ,
          onTap: (index){

            changePage(index);

          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 25,
//          fixedColor: Colors.yellow,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(
            color: Colors.blue,
            opacity: 1,
            size: 25,
          ),
          unselectedIconTheme:
          IconThemeData(color: Colors.blue, opacity: 0.8, size: 25),
          selectedFontSize: 2,
          unselectedFontSize: 2,
          selectedLabelStyle: TextStyle(
            color: Colors.purpleAccent,
            fontSize: 15,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.purpleAccent,
            fontSize: 15,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
        body: _allPages.elementAt(currentIndex),
      ),

    );

  }

  void changePage (index){
    if(index != currentIndex){
      setState(() {
        currentIndex = index;
      });
    }
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/bloc_provider.dart';
import 'package:flutter_app/bloc/home_bloc.dart';
import 'package:flutter_app/model/homeModel.dart';
import 'package:flutter_app/ui/AttendanceApply.dart';
import 'package:flutter_app/utils/index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../bloc/home_bloc.dart';
import 'LeaveApply.dart';
import 'MessagePage.dart';
import 'package:flutter_app/ui/AttendanceApplyPage.dart';
class HomePage1 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    RefreshController _controller = RefreshController();
    //final homeBloc bloc = BlocProvider.of<homeBloc>(context);
    //LogUtil.d(bloc);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
        leading: Container(
          child: null,
        ),
        actions: [
          FlatButton(onPressed: (){
        
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage()));
              
          }, child: Image.asset('images/notice.png',width: 13,height: 13,color: Colors.white54,),minWidth: 13,)
        ],
      ),
      body:BlocProvider<homeBloc>(
        bloc: homeBloc(),
        child: ContentPage(),


        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: Colors.transparent,
        child: Image.asset('images/floatingActionImg.png'),
      ),
      );
  }
}
class ContentPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    final homeBloc bloc = BlocProvider.of<homeBloc>(context);
    Future.delayed(Duration(milliseconds: 500), () {

    });

    bloc.getHomeData();
    return bloc.homeStream == null ? Center(
      child: CircularProgressIndicator(),
    ):  Column(

      children: [
        StreamBuilder(
          stream: bloc.homeStream,
          builder: (BuildContext context,AsyncSnapshot<HomeModel> snapshot){

            return AspectRatio(
              aspectRatio: 16.0/9.0,
              child: Swiper(
                itemWidth: size.width,
                itemBuilder: (BuildContext  context,int index){

                  return Image.network(snapshot.data.banner.elementAt(index).url,
                    fit: BoxFit.cover,
                  );

                },
                autoplay: true,
                itemCount: snapshot.data.banner.length,
                scrollDirection: Axis.horizontal,
                pagination: SwiperPagination(),
                //control: new SwiperControl(),
              ),
            );

          },

        ),
        StreamBuilder(
          stream: bloc.homeStream,
          builder: (BuildContext context,AsyncSnapshot<HomeModel>snapshot){
            return  Container(
              padding: EdgeInsets.only(top: 10),
              width: size.width,
              //color: Colors.red,
              height: 189,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [

                      IconTextWidget(context, 'images/Img_${snapshot.data.navigate.elementAt(0).MenuCode}.png', '${snapshot.data.navigate.elementAt(0).Mname}',0),

                      IconTextWidget(context, 'images/Img_${snapshot.data.navigate.elementAt(1).MenuCode}.png', '${snapshot.data.navigate.elementAt(1).Mname}',1),

                      IconTextWidget(context, 'images/Img_${snapshot.data.navigate.elementAt(2).MenuCode}.png', '${snapshot.data.navigate.elementAt(2).Mname}',2),

                      IconTextWidget(context, 'images/Img_${snapshot.data.navigate.elementAt(3).MenuCode}.png', '${snapshot.data.navigate.elementAt(3).Mname}',3),



                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      IconTextWidget(context, 'images/Img_${snapshot.data.navigate.elementAt(4).MenuCode}.png', '${snapshot.data.navigate.elementAt(4).Mname}',4),

                      IconTextWidget(context, 'images/Img_${snapshot.data.navigate.elementAt(5).MenuCode}.png', '${snapshot.data.navigate.elementAt(5).Mname}',5),

                      IconTextWidget(context, 'images/Img_${snapshot.data.navigate.elementAt(6).MenuCode}.png', '${snapshot.data.navigate.elementAt(6).Mname}',6),

                      IconTextWidget(context, 'images/more.png', '更多',7),

                    ],
                  )
                ],
              ),
            );
          },


        ),
        StreamBuilder(
          stream: bloc.homeStream,
          builder:(BuildContext context,AsyncSnapshot<HomeModel>snapshot){

            return Expanded(
                    child: ListView.builder(

                      itemCount: snapshot.data.notice.length,
                      itemBuilder: (context,index){

                        return ListViewSubWidget(context, snapshot.data.notice.elementAt(index)) ;
                      },

                    ));

          } ,
          /*
          ListTile(
                  leading: Icon(Icons.alarm),
                  title: Text('${snapshot.data.notice[index].title}\n类型${snapshot.data.notice[index].type}发布人${snapshot.data.notice[index].announer}发布日期${snapshot.data.notice[index].publishTime}',style: TextStyle(fontSize: 13),),
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                )
          */


        )
      ],

    );
  }
}
Widget IconTextWidget(BuildContext context,String imagePath,String Mname ,int index){



  final size = MediaQuery.of(context).size;
  double padding = 15;
  double width1 = ((size.width - 5 * padding)/4);
  //LogUtil.d('width:${width1}');
  //double height = 75 ;

  return GestureDetector(
    onTap: (){
      //final snackBar = new SnackBar(content:Text('123'));
      //Scaffold.of(context).showSnackBar(snackBar);
      if(index == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceApplyPageOne()));

      }else if(index == 1){

      }else if(index == 2){

      }else if(index == 3){

      }else if(index == 4){

      }else if(index == 5){

        Navigator.push(context, MaterialPageRoute(builder: (context) => LeaveApply()));

      }else if(index == 6){

      }


    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          //color: Colors.blue,
          width: 44,
          height: 44.5 ,
          child: Image.asset(imagePath,fit: BoxFit.contain,width: 44,height: 44.5,),
        ),
        Container(
          //color: Colors.yellow,
          width: width1,
          height: 40 ,
          child: Text(Mname,style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),

        )


      ],
    ),

  );

}
Widget ListViewSubWidget (BuildContext context,NoticeBean noticeBean ){
  final size = MediaQuery.of(context).size;
  return Container(
    child: Row(

      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 5,top: 15),
          width: 26,
          height: 26,
          child: Image.asset('images/notice.png',fit: BoxFit.contain,width: 13,height: 13,),

        ),
        Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width - 36,
              height: 40,
              //color: Colors.blue,
              child: Text('${noticeBean.title}',style: TextStyle(fontSize: 14,color: Colors.black),),
            ),
            Container(
              width: size.width - 36,
              height: 20,
              //color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('类型 ${noticeBean.type}',style: TextStyle(color: Colors.grey,fontSize: 12),),
                  ),
                  Container(
                    child: Text('发布人 ${noticeBean.announer}',style: TextStyle(color: Colors.grey,fontSize: 12)),
                  ),
                  Container(
                    child: Text('发布日期 ${noticeBean.publishTime}',style: TextStyle(color: Colors.grey,fontSize: 12)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1,
              width: size.width - 36,
              child: Container(
                color: Color(0xFFEEEEEE),
              ),
            )
          ],
        )
      ],
    ),
  );

}

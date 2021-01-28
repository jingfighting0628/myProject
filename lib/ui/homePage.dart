
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/loginModel.dart';
import 'package:flutter_app/model/homeModel.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/ui/ifeiyv_icon_text_button.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'LeaveApply.dart';
import 'package:flutter_app/utils/index.dart';
class homePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}
class _HomePageState extends State<homePage>{


  HomeModel data ;

  @override
  void initState() {
    // TODO: implement initState

    getHomeData();

    super.initState();
  }

  void getHomeData()async{

    var responseBody;
    await SpUtil.getInstance();
    String AppTicket = SpUtil.getString('AppTicket');
    LogUtil.d(AppTicket);
    int userId = SpUtil.getInt('userID');
    HttpClient client = HttpClient();
    //var uri = 'http://218.12.25.203:8008/api/app/FirstPage';
    var uri = Uri.http('218.12.25.203:8008', '/api/app/FirstPage',{'userId':userId.toString()});
    HttpClientRequest request = await client.getUrl(uri);
    request.headers.set('ticket', AppTicket);

    HttpClientResponse response = await request.close();

    if(response.statusCode == 200){
      responseBody = await response.transform(utf8.decoder).join();
      LogUtil.d('responseBody:${responseBody}');
      responseBody = json.decode(responseBody);
      //HomeModel homeModel = HomeModel.fromMap(responseBody['result']);
      setState(() {
        data =  HomeModel.fromMap(responseBody['result']);

        LogUtil.d('images/Img_${data.navigate.elementAt(0).MenuCode}.png');
      });
    }else{
      LogUtil.d('请求失败');
    }

  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.alarm), onPressed: (){
            ///点击进入消息列表页面


          })

        ],

      ),
      body: Column(
        children: [
          Container(
            width: size.width,
            height: 172,
            child: Swiper(
              itemWidth: size.width,
              itemBuilder: (BuildContext  context,int index){

                return Image.network(data.banner.elementAt(index).url,
                  fit: BoxFit.cover,
                );

              },
              autoplay: true,
              itemCount: data.banner.length,
              scrollDirection: Axis.horizontal,
              pagination: SwiperPagination(),
              control: new SwiperControl(),
            ),
          ),
          Container(
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

                    IconTextWidget(context, 'images/Img_${data.navigate.elementAt(0).MenuCode}.png', '${data.navigate.elementAt(0).Mname}',0),

                    IconTextWidget(context, 'images/Img_${data.navigate.elementAt(1).MenuCode}.png', '${data.navigate.elementAt(1).Mname}',1),

                    IconTextWidget(context, 'images/Img_${data.navigate.elementAt(2).MenuCode}.png', '${data.navigate.elementAt(2).Mname}',2),

                    IconTextWidget(context, 'images/Img_${data.navigate.elementAt(3).MenuCode}.png', '${data.navigate.elementAt(3).Mname}',3),



                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    IconTextWidget(context, 'images/Img_${data.navigate.elementAt(4).MenuCode}.png', '${data.navigate.elementAt(4).Mname}',4),

                    IconTextWidget(context, 'images/Img_${data.navigate.elementAt(5).MenuCode}.png', '${data.navigate.elementAt(5).Mname}',5),

                    IconTextWidget(context, 'images/Img_${data.navigate.elementAt(6).MenuCode}.png', '${data.navigate.elementAt(6).Mname}',6),

                    IconTextWidget(context, 'images/more.png', '更多',7),

                  ],
                )
              ],
            ),
          ),
          Expanded(

            child: ListView.builder(

              itemCount: data.notice.length,
              itemBuilder: (context,index){

                return ListTile(
                  leading: Icon(Icons.alarm),
                  title: Text('${data.notice[index].title}\n类型${data.notice[index].type}发布人${data.notice[index].announer}发布日期${data.notice[index].publishTime}',style: TextStyle(fontSize: 13),),
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                );
              },

            ),


          )

        ],
      )
    );
  }
}

Widget IconTextWidget(BuildContext context,String imagePath,String Mname ,int index){

  SizeConfig().init(context);

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





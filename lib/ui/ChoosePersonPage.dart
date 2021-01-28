

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart';
import 'package:flutter_app/model/LiveTogetherModel.dart';
class ChoosePersonPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChoosePersonPageState();
  }
}
class _ChoosePersonPageState extends State<ChoosePersonPage>{

  LiveTogetherModel data;
  List stateList = List();
  @override
  void initState() {
    // TODO: implement initState

    getData();

    super.initState();
  }
  getData()async{

    HttpClient client = HttpClient();
    var uri = Uri.http('218.12.25.203:8008', '/api/app/LiveTogether');
    HttpClientRequest request = await client.getUrl(uri);
    await SpUtil.getInstance();
    String AppTicket = SpUtil.getString('AppTicket');
    request.headers.set('ticket', AppTicket);

    HttpClientResponse response = await request.close();
    var responseBody;
    if(response.statusCode == 200){
      responseBody = await response.transform(utf8.decoder).join();
      responseBody = json.decode(responseBody);
      LiveTogetherModel  liveTogetherModell = LiveTogetherModel.fromMap(responseBody);

      LogUtil.d(liveTogetherModell.result);
      setState(() {
        data = liveTogetherModell;
        liveTogetherModell.result.forEach((element) {

          stateList.add('0');
        });
      });
    }else {
      LogUtil.d('请求失败');
    }
  }

  Widget childWidget (BuildContext context,LiveTogetherModel data,int index){

    final size = MediaQuery.of(context).size;
    //LogUtil.d(index);
    //LogUtil.d(stateList[index]);

    List<ListEmployeBean> list = data.result.elementAt(index).ListEmploye;
    
    List<Widget> ContainerList = List();

    ContainerList.add(Container(
      padding: EdgeInsets.only(left: 15),
      width: size.width -15,
      height: 40,
      child: Text('${data.result[index].Value}(${data.result[index].ListEmploye.length}人)'),
    ));
    List<GestureDetector> list1 = List();
    if(stateList[index] == '1'){

      list.forEach((ListEmployeBean) {
        list1.add(GestureDetector(
          onTap: (){
            LogUtil.d(ListEmployeBean.Value);

            Navigator.pop(context,ListEmployeBean);


          },
          child: Container(
            width: size.width - 15,
            padding: EdgeInsets.only(left: 15),
            height: 40,
            child: Text('${ListEmployeBean.Value}'),
          ),
        ));
      });

    }

    ContainerList.addAll(list1);


    return Column(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ContainerList,

    );



  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('选择交接人'),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount:data.result.length ,
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            if(stateList[index] == '0'){
              stateList[index] = '1';
            }else{
              stateList[index] = '0';
            }

            setState(() {
              stateList = stateList;
            });

          },
          child: childWidget(context, data, index),
        );
      },

    ),
    );
  }
}


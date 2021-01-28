
import 'package:flutter_app/utils/index.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_app/model/homeModel.dart';
class WanRepository{

  Future getHomeData()async{
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
      HomeModel homeModel;
      if(response.statusCode == 200){
        responseBody = await response.transform(utf8.decoder).join();
        LogUtil.d('responseBody:${responseBody}');
        responseBody = json.decode(responseBody);
        homeModel = await HomeModel.fromMap(responseBody['result']);
        return homeModel;
      }else{
        LogUtil.d('请求失败');
      }
      return homeModel ;
    }

}
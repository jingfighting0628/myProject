import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/LogUtil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_app/model/loginModel.dart';
import 'package:flutter_app/ui/mian_page.dart';
import 'package:flutter_app/ui/main_page1.dart';
import 'package:flutter_app/utils/index.dart';
class LoginPage1 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState1();
  }

}
class _LoginPageState1 extends State<LoginPage1>{

  var username ='';
  var pwd = '';
  var data ;
  LoginModel _loginModel;
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode  focusScopeNode;




  @override
  Widget build(BuildContext context) {
    void showAlertDialog(String msg,BuildContext context) {
      showDialog<Null>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text('提示'),
              //可滑动
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text(msg),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('确定'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
    void login(String username ,String password,BuildContext context) async{
      LogUtil.d('username:${username},pwd:${password}');
      if(username == ''){
        showAlertDialog('用户名不能为空', context);
        return ;
      }
      if(password == ''){
        showAlertDialog('密码不能为空', context);
        return;
      }

      Fluttertoast.showToast(
          msg: "正在登录...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      var responseBody;
      Dio dio = Dio();
      Response response;
      response = await dio.post('http://218.12.25.203:8008/api/app/Login',data:{'username':username,'pwd':password});
      LogUtil.d(response);
      if(response.statusCode == 200){
        //responseBody = await response.transform(utf8.decoder).join();
        responseBody = response.data;
        LogUtil.d('${responseBody }');
        print('${responseBody.toString()}');

        String statatus = responseBody['status'].toString();

        LogUtil.d('Status:${statatus}');
        if(statatus == '0'){

          showAlertDialog(responseBody['msg'], context);

        }else if (statatus == '1'){
          //LogUtil.d('responseBody:${responseBody}');
          //SpUtil.putString('AppTicket', responseBody['AppTicket']);
          _loginModel = LoginModel.fromMap(responseBody['result']);
          SpUtil spUtil = await SpUtil.getInstance();
          SpUtil.putString('AppTicket', responseBody['result']['AppTicket']);
          SpUtil.putInt('userID', responseBody['result']['userID']);
          SpUtil.putObject('loginModel', _loginModel.toJson());
          int userID =  SpUtil.getInt('userID');
          String AppTicket = SpUtil.getString('AppTicket');
          LogUtil.d(userID);
          LogUtil.d(AppTicket);
          Fluttertoast.showToast(
                  msg: "登录成功",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 16.0);
          Navigator.push(context, MaterialPageRoute(builder:(context) =>MainPage()));
        }
      }else{
        print('error');
      }
      setState(() {
        data = responseBody['result'];
        LogUtil.d('data:${data}');
      });
      /*
      HttpClient client = HttpClient();
      var responseBody;
      // client.post('', 8008, '').then(Request );
      Map <String,String> map = Map();
      map['username'] = username;
      map['pwd'] = password;
      //var uri =  'http://218.12.25.203:8008/api/app/Login' ;
      // = Uri(scheme:'http', host: '218.12.25.203',port: 8008,path: '/api/app/Login',queryParameters: {'username':username,'pwd':password});
      Uri uri = Uri(scheme: 'http',host: '218.12.25.203',port: 8008,path: '/api/app/Login',queryParameters: {'username':username,'pwd':password});
      HttpClientRequest request = await client.postUrl(uri);
      request.headers.set('content-type', 'application/json');
      //request.add(utf8.encode(json.encode(map)));

      HttpClientResponse response = await request.close();

      */

    }


    // TODO: implement build
    usernameController.addListener(() {

      //LogUtil.d('usernameController:${usernameController.text}');

    });
    pwdController.addListener(() {
      //LogUtil.d('pwdController:${pwdController.text}');
    });
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    //LogUtil.d('width${width} height:${height}');
    Widget ContentWidget = Column(

      children: [
        Container(
          //color: Colors.red,
          width: size.width,
          height: size.height/4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(

                child: Image.asset('images/LoginLogo.png',width: 80,height: 80,fit: BoxFit.cover,),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('网络分公司综合办公系统',style: TextStyle(color: Colors.white,fontSize: 16),),
              ),

            ],
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Expanded(
          child: Container(
            //color: Colors.yellow,
            width: size.width,
            height: size.height/2,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  cursorColor: Colors.white,
                  cursorWidth: 1,
                  controller: usernameController,
                  style: TextStyle(color: Colors.white,fontSize: 15),
                  decoration: InputDecoration(
                    //fillColor: Colors.white,
                    //filled: true,
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          //labelText: '请输入用户名',
                          //labelStyle: TextStyle(color: Colors.white),
                          hintText: '请输入用户名',
                          hintStyle: TextStyle(color: Colors.white,fontSize: 13),
                          enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                          )
                  ),
                  onChanged: (value){
                    //LogUtil.d('onChanged-username:${value}');

                  },
                  onSubmitted: (value){
                    //LogUtil.d('onSubmitted-username:${value}');
                  },
                  obscureText: false,
                ),
                SizedBox(
                  height: 4,
                ),
                TextField(
                  cursorColor: Colors.white,
                  cursorWidth: 1,
                  controller: pwdController,

                  focusNode: focusNode2,


                  style: TextStyle(color: Colors.white,fontSize: 15),
                  decoration: InputDecoration(
                          icon:Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          //labelText: '请输入密码'
                          hintText: '请输入密码',
                          hintStyle: TextStyle(color: Colors.white,fontSize: 13),
                          enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                          )
                  ),
                  onChanged: (value){
                    //LogUtil.d('onChanged-pwd:${value}');

                  },
                  onSubmitted: (value){
                    //LogUtil.d('onSubmitted-pwd:${value}');
                  },
                  onTap: (){
                    LogUtil.d('onTap2');
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                  obscureText: false,
                ),
                SizedBox(
                  height: 11,
                ),
                Container(

                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: 360,
                  height: 51,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      //color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage('images/LoginBtnBg.png'),
                        fit: BoxFit.cover,

                      )

                  ),
                  child:  FlatButton(
                    onPressed: (){
                      LogUtil.d('ClickLoginButton:username:${usernameController.text},pwd:${pwdController.text}');
                      login(usernameController.text, pwdController.text, context);
                    },
                    child: Text('登录',style: TextStyle(color: Colors.white,fontSize: 18)),
                  ),

                ),
              ],
            ),
          ),
        )

      ],
    );
    Widget loginLogonArea = Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/login.png',),
          fit: BoxFit.cover
        )
      ),
      //padding: EdgeInsets.only(top: 100),
      //alignment: Alignment.topCenter,
      child: ContentWidget,


    );


    return Scaffold(
      appBar: null,
      body: loginLogonArea,
    );
  }



}

/*
*  Container(
                  child: TextField(

                    focusNode: focusNode1,

                    cursorColor: Colors.white,
                    cursorWidth: 1,
                    //cursorHeight: 29,

                    controller: usernameController,
                    maxLines: 1,
                    obscureText: false,
                    textAlign:TextAlign.left ,
                    style: TextStyle(
                      color: Colors.white,
                      //backgroundColor: Colors.yellow,
                      fontSize: 13,
                      //letterSpacing: 3,
                      //wordSpacing: 10,

                    ),
                    keyboardType:TextInputType.datetime ,
                    textInputAction:TextInputAction.go ,
                    enabled: true,
                    decoration: InputDecoration(
                      //fillColor: Colors.grey,
                      filled: true,
                      hintText: '请输入用户名',
                      hintStyle: TextStyle(color: Colors.white,fontSize: 13),
                      //labelText: '用户名',
                      prefixIcon: Icon(Icons.person,color: Colors.white,),

                      //suffixText: '用户名',
                      //suffixIcon: Icon(Icons.add),
                            enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                            ),
                            focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                            )
                    ),
                    onChanged: (value){
                      print('onChanged1:${value}');
                    },
                    onSubmitted: (value){
                      print('onSubmitted1${value}');
                    },
                    onTap: (){
                      print('onTap1');
                      /*
                  if(null == focusScopeNode){
                    focusScopeNode = FocusScope.of(context);
                  }
                  focusScopeNode.requestFocus(focusNode1);

                   */
                    },
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  child: TextField(

                    focusNode: focusNode2,
                    cursorColor: Colors.white,
                    //cursorWidth: 1,
                    //maxLength: 1,

                    controller: pwdController,
                    maxLines: 1,
                    ///是否是密码
                    obscureText: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      //backgroundColor: Colors.orange,
                      fontSize: 13,
                      //letterSpacing: 1,
                      //wordSpacing: 3,

                    ),
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.phone,
                    onChanged: (value){
                      print('onChanged2:${value}');
                    },
                    onSubmitted: (value){
                      print('onSubmitted2${value}');
                    },
                    onTap: (){
                      print('onTap2');
                      /*
                  if(null == focusScopeNode){
                    focusScopeNode = FocusScope.of(context);
                  }
                  focusScopeNode.requestFocus(focusNode2);

                   */
                    },
                    decoration: InputDecoration(
                            hintText: '请输入密码',
                            hintStyle: TextStyle(color: Colors.white,fontSize: 13),
                            prefixIcon: Icon(Icons.lock,color: Colors.white,),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                            ),
                            focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                            )

                    ),
                  ),
                ),
*
* */




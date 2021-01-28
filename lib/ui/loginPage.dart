

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/LogUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';




class loginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _loginPageState();
  }
}
class _loginPageState extends State<loginPage>{

  FocusNode _focusNodeUserName = FocusNode();
  FocusNode _focusNodePassword = FocusNode();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _password = '';
  var _username = '';
  var _isShowPwd = false;
  var _isShowClear = false;
  var data;
  @override
  void initState() {
    // TODO: implement initState
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassword.addListener(_focusNodeListener);
    _focusNodeUserName.addListener(() {
      if(_userNameController.text.length > 0){
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _focusNodePassword.removeListener(_focusNodeListener);
    _focusNodeUserName.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  String validateUserName(value){
    if(value == ''){

      return '用户名不能为空';
    }
    return null;
  }
  String validatePassword(value){
    if(value == ''){
      return '密码不能为空';

    }
    return null;
  }
  void login(String username ,String password,BuildContext context) async{

    HttpClient client = HttpClient();
    var responseBody;
    // client.post('', 8008, '').then(Request );
    Map <String,String> map = Map();
    map['username'] = username;
    map['pwd'] = password;
    var uri =  'http://218.12.25.203:8008/api/app/Login' ;
    // = Uri(scheme:'http', host: '218.12.25.203',port: 8008,path: '/api/app/Login',queryParameters: {'username':username,'pwd':password});
    HttpClientRequest request = await client.postUrl(Uri.parse(uri));

    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(map)));
    HttpClientResponse response = await request.close();
    if(response.statusCode == 200){
      SmartDialog.dismiss();
      responseBody = await response.transform(utf8.decoder).join();
      responseBody = json.decode(responseBody);

      print('${responseBody.toString()}');

      String statatus = responseBody['status'].toString();
      if(statatus == '0'){

        LogUtil.d('status:${statatus}');

        showAlertDialog(responseBody, context);

      }else if (statatus == '1'){
        LogUtil.d('status:${statatus}');
        SpUtil.putObject('AppTicket', responseBody['AppTicket']);

        Fluttertoast.showToast(
            msg: "登录成功",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 16.0);
      }

    }else{
      print('error');
    }
    setState(() {
      data = responseBody;
    });
  }

  Future<Null> _focusNodeListener ()async{
   if(_focusNodeUserName.hasFocus){
     _focusNodePassword.unfocus();
   }
   if(_focusNodePassword.hasFocus){
     _focusNodeUserName.unfocus();
   }
  }
  void showAlertDialog(var responseBody,BuildContext context) {
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
                  new Text('${responseBody['msg']}'),
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _userNameController.addListener(() {

      _username = _userNameController.text;
    });
    _passwordController.addListener(() {
      _password = _passwordController.text;
    });
    Widget backgroundImage = Container(
      child: Image.asset('images/login.png'),
    );
    
    
    Widget loginImageArea = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/login.png'),
        ),
      ),
      alignment: Alignment.topCenter,
        child: Image.asset(
          'images/LoginLogo.png',
          width: 100,
          height: 100,
          fit:BoxFit.cover,
        ),
    );

    Widget intutTextArea = Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.blue
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _userNameController,
              focusNode: _focusNodeUserName,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入账号',
                prefixIcon: Icon(Icons.person,color: Colors.white,),
                suffixIcon: (_isShowClear) ? IconButton(icon: Icon(Icons.clear), onPressed: (){
                  _userNameController.clear();
                }):null),
                onSaved: (value){
                  _username = value;
                },
              validator:validateUserName ,

              ),

            TextFormField(
              focusNode: _focusNodePassword,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock,color: Colors.white,),
                suffixIcon: IconButton(icon: Icon((_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                onPressed:(){
                  setState(() {
                    _isShowPwd = !_isShowPwd;
                  });
                } ,
                ),

              ),
              obscureText: !_isShowPwd,
              onSaved: (value){
                _password = value;
              },
              validator: validatePassword,
            )
          ],
        ),
      ),
    );

    Widget loginButtonArea = Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.blue[200],
        child: Text(
          '登录',
          style: TextStyle(fontSize: 16,color: Colors.white),

        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) ),
        onPressed: (){
          _focusNodeUserName.unfocus();
          _focusNodePassword.unfocus();
          if(!_formKey.currentState.validate()){
            _formKey.currentState.save();
            print('$_username,$_password');
          }
          SmartDialog.showLoading();
          login(_username,_password,context);
        },
      ),
    );



    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: (){
          _focusNodePassword.unfocus();
          _focusNodeUserName.unfocus();
        },
        child: ListView(
          children: [
            SizedBox(height: 80,),
            loginImageArea,
            SizedBox(height:70,),
            intutTextArea,
            SizedBox(height:45,),
            loginButtonArea
          ],
        ),
      ),
    );
  }
}



  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:flutter_app/model/LiveTogetherModel.dart';
  import 'package:flutter_app/ui/ifeiyv_icon_text_button.dart';
  import 'package:flutter_app/utils/index.dart';
  import 'package:flutter_app/model/leaveApplyModel.dart';
  import 'package:flutter_picker/flutter_picker.dart';
  import 'package:flutter_app/ui/ChoosePersonPage.dart';
  import 'package:flutter/cupertino.dart';
  class LeaveApply extends StatefulWidget{


    @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _leaveApplyState();
    }

  }

  class _leaveApplyState extends State<LeaveApply>{

    LeaveApplyModel data ;
    ListEmployeBean listEmployeBean;
    String userName;
    String deptname;
    DateTime startDate;
    String stateDateString;
    DateTime endDate;
    String endDateString;
    String leaveType;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    var responseBody1;
    void GetSelect()async{

      await SpUtil.getInstance();
      Map map = SpUtil.getObject('loginModel');
      String uid = map['userID'].toString();
      String uname = map['userName'];
      String AppTicket = SpUtil.getString('AppTicket');
      String deptName = map['deptName'];
      HttpClient client = HttpClient();
      var uri = Uri.http('218.12.25.203:8008', '/api/app/v1.1/GetSelect',{'uid':uid,'uname':uname,'emid':uid,'select':'139'});
      HttpClientRequest request = await client.getUrl(uri);
      request.headers.set('ticket', AppTicket);

      HttpClientResponse response = await request.close();
      var responseBody;
      if(response.statusCode == 200){
        responseBody = await response.transform(utf8.decoder).join();
        responseBody = json.decode(responseBody);
        LeaveApplyModel model = LeaveApplyModel.fromMap(responseBody['result']);
        setState(() {
          data = model;
          responseBody1 = responseBody;
          userName = uname;
          deptname = deptName;
          LogUtil.d('responseBody:${responseBody1}');
        });

      }else{
        LogUtil.d('请求失败');
      }
    }
    @override
    void initState() {
      // TODO: implement initState
      GetSelect();
      super.initState();
    }
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
    showPicker(BuildContext context,List list) {
      Picker picker = Picker(
          adapter: PickerDataAdapter<String>(pickerdata:list),
          changeToFirst: false,
          textAlign: TextAlign.left,
          textStyle: const TextStyle(color: Colors.blue),
          selectedTextStyle: TextStyle(color: Colors.red),
          columnPadding: const EdgeInsets.all(8.0),
          onConfirm: (Picker picker, List value) {
            print(value.toString());

            print(picker.getSelectedValues());

            setState(() {
              leaveType = picker.getSelectedValues().elementAt(0).toString();
            });


          }
      );
      picker.show(_scaffoldKey.currentState);
    }
    showPickerDateTime(BuildContext context,int index) {
      new Picker(
          adapter: new DateTimePickerAdapter(
            type: PickerDateTimeType.kYMD,
            isNumberMonth: true,
            //strAMPM: const["上午", "下午"],
            yearSuffix: "年",
            monthSuffix: "月",
            daySuffix: "日",
            minValue: DateTime.now(),
            minuteInterval: 30,
            minHour: 1,
            maxHour: 23,
            // twoDigitYear: true,
          ),
          title: new Text(""),
          textAlign: TextAlign.right,
          selectedTextStyle: TextStyle(color: Colors.blue),
          delimiter: [
            PickerDelimiter(column: 5, child: Container(
              width: 16.0,
              alignment: Alignment.center,
              child: Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
              color: Colors.white,
            ))
          ],
          onConfirm: (Picker picker, List value) {
            print(picker.adapter.text);
            setState(() {
              LogUtil.d(picker.adapter.toString());
              if(index == 1){
                LogUtil.d(picker.adapter.toString().substring(0,10).toString());
                stateDateString = picker.adapter.toString().substring(0,10).toString();
                startDate = DateTime.parse(picker.adapter.toString().substring(0,10).toString());
                print(startDate);
              }else{
                endDateString = picker.adapter.toString().substring(0,10);
                endDate = DateTime.parse(picker.adapter.toString().substring(0,10).toString());
                LogUtil.d(startDate);
                LogUtil.d(endDate);

              }
            }
            );
          },
          onSelect: (Picker picker, int index, List<int> selecteds) {

          }
      ).show(_scaffoldKey.currentState);
    }
    Widget TitleInputContainer (BuildContext context,String title,String hintText,int index){

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,top: 3,bottom: 3),
            //color: Colors.blue,
            child: Text(title,style: TextStyle(color: Colors.black,fontSize: 14),textAlign:TextAlign.start ,),
          ),
          Container(
            //color: Colors.red,

            child: index == 0 ? CupertinoTextField(

              placeholder: hintText,
              maxLines: 5,
              placeholderStyle: TextStyle(fontSize: 13,color: Colors.grey),
              // cursorRadius: ,
              decoration: BoxDecoration(

              ),


            ):attechmentWidget(context),
          )
        ],
      );
    }

    ///附件的Widget
    Widget attechmentWidget(BuildContext context){

      int padding = 10;
      final size = MediaQuery.of(context).size;
      double width = (size.width - 50)/4;
      double height = 57.5;

      return Container(
        //color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Container(
                  height: height,
                  width: width,
                  //color: Colors.red,
                  child: Image.asset('images/plus1.png',fit: BoxFit.contain,),
                ),
                Container(
                  height: height,
                  width: width,
                  //color:Colors.blue,
                  child: Text('2'),
                ),
                Container(
                  height: height,
                  width: width,
                  //color: Colors.yellow,
                  child: Text('3'),
                ),
                Container(
                  height: height,
                  width: width,
                  //color: Colors.pink,
                  child: Text('4'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Container(
                  height: height,
                  width: width,
                  //color: Colors.red,
                  child: Image.asset('images/plus.png',fit: BoxFit.contain,width: 40,height: 40,),
                ),
                Container(
                  height: height,
                  width: width,
                  //color:Colors.blue,
                  child: Text('2'),
                ),
                Container(
                  height: height,
                  width: width,
                  //color: Colors.yellow,
                  child: Text('3'),
                ),
                Container(
                  height: height,
                  width: width,
                  //color: Colors.pink,
                  child: Text('4'),
                )
              ],
            ),
          ],
        )
      );

    }


    Widget showInputText (BuildContext context ,String title,String hintText,String labelText,int index){

      final size = MediaQuery.of(context).size;

      return Row(

        children: [

          Container(
            width: 75,
            height: 40,
            padding: EdgeInsets.only(left: 10),
            //color: Colors.red,
            child: Center(
              child: Text('${title}',style: TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,),
            ),
          ),
          GestureDetector(
            onTap: (){
             if(index == 1){
               List select = responseBody1['result']['Selects'][0]['Select'];
               List list = List();
               select.forEach((element) {

                 list.add(element['value']);
               });
               LogUtil.d(list);
               showPicker(context, list);
             }else if(index == 2){

               Navigator.push(context, MaterialPageRoute(builder: (context) => ChoosePersonPage())).then((value){
                 setState(() {
                   listEmployeBean = value;

                 });
               });

             }else if(index == 3){

              showPickerDateTime(context,1);

             }else if (index == 4){
               showPickerDateTime(context,2);
             }

            },
            child: Container(
              width: size.width - 75,
              height: 40,
              padding: EdgeInsets.only(left: 10),
              //color: Colors.blue,
              child: TextField(
                decoration: InputDecoration(
                    hintText:  hintText,
                    hintStyle: TextStyle(fontSize: 13,color: Colors.grey),
                    labelText: labelText,
                    labelStyle: TextStyle(fontSize: 13,color: Colors.black)
                ),
                enabled: false,

              ),
            ),
          )
        ],


      );
    }
    @override
    Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
      // TODO: implement build
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('请假申请'),
          centerTitle: true,
        ),


        body:SingleChildScrollView(

          child: Container(
            //color: Colors.grey,
            width: size.width,
            height: size.height +202,
            child:  Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                  child: Container(
                      color: Color(0xFFEEEEEE)
                  ),
                ),
                showInputText(context, '请 假 人','',userName,0),
                showInputText(context, '部      门','',deptname,0),
                SizedBox(
                  height: 10,
                  child: Container(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                showInputText(context, '请假类型','请选择',leaveType == null ? null: leaveType,1),
                showInputText(context, '交  接  人','请选择',listEmployeBean == null ? null: listEmployeBean.Value,2),
                showInputText(context, '起始日期','请选择',stateDateString == null ?null :stateDateString,3),
                showInputText(context, '结束日期','请选择',endDateString == null ? null:endDateString,4),
                showInputText(context, '请假天数','请选择请假起始日期和结束日期',null,5),

                SizedBox(
                  height: 10,
                  child: Container(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 154,
                  child: TitleInputContainer(context, '请假是由', '请详细说明请假是由(在校生回校毕业设计或答辩需提供班主任签字或学校盖章的相关证明书并写明起始日期和校方联系人电话作为附件上传)',0),
                ),
                SizedBox(
                  height: 10,
                  child: Container(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 154,
                  child: TitleInputContainer(context, '交接内容', '请详细说明交接内容',0),
                ),
                SizedBox(
                  height: 10,
                  child: Container(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 150,
                  child: TitleInputContainer(context, '交接附件(仅限图片)', '',1),
                ),
                SizedBox(
                  height: 10,
                  child: Container(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                Container(
                  //color: Colors.red,
                  height: 100,
                  child: Text('*员工必须在请假开始之日前完成请假申请及审批，否则视为未经同意擅自离场,并按旷工处理\n*员工必须在请假结束之日后的第一天完成销假审批，否则视为未经同意擅自离场，并按旷工处理\n'
                      '*员工仅能申请请假提交日期次日及以后的假，请务必...',style: TextStyle(color: Colors.red,fontSize: 10),)
                ),
                GestureDetector(
                  onTap: (){
                    LogUtil.d('提交审批');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    width: size.width - 20,
                    height: 40,
                    //color: Colors.blue,
                    child: Center(
                      child: Text('提交审批',style: TextStyle(color: Colors.white,),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue
                    ),
                  ),
                )
              ],

            ),
          ),

        )
      );
    }

  }




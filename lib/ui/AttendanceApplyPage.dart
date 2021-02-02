import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/AttendanceApplyModel.dart';
import 'package:flutter_app/model/loginModel.dart';
import 'package:flutter_app/repository/WanRepository.dart';
import 'package:flutter_app/utils/index.dart';
import 'package:flutter/material.dart';
class AttendanceApplyPageOne extends StatefulWidget{
	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AttendanceApplyPageState();
  }
}

class _AttendanceApplyPageState extends State<AttendanceApplyPageOne>{


	String username;
	String applyDate;

	AttendanceApplyModel model;
	final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



	Color getContainerColor (DicSignBean dicSignBean){

		if(dicSignBean.Value == '0'){
			return Colors.transparent;
		}
		else if(dicSignBean.Value == '1'){
			return Colors.green;
		}
		return Colors.white;

	}
	List<Container> AttendanceStateContainer (BuildContext context,AttendanceApplyModel model){

		List<Container> list = List();
		final size = MediaQuery.of(context).size;
		final width  = 50;
		final height = 25;

		model.DicSign.forEach((DicSignBean) {

			list.add(Container(
				color: getContainerColor(DicSignBean),
				child: Text(DicSignBean.Key),
			));

		});
		return list;
	}


	Widget ApplyStateWidget(BuildContext context,AttendanceApplyModel model){
		final size = MediaQuery.of(context).size;

		final padding = (size.width -80 -5 - 8 -  5 *45 -5)/4;


		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [

				Container(
					width: 80,
					height: 80,
					padding: EdgeInsets.only(left: 5,top: 8),
					child: Text('考勤申报',style: TextStyle(fontSize: 13,),textAlign: TextAlign.center,),

				),
				Container(
					width: size.width - 80,
					height: 80,
					child: Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Container(
								height: 40,
								child: Row(
									children: [
										SizedBox(
											width: 8,
										),
										Container(

											child: Center(
												child: Text(model.DicSign.elementAt(0).Key),
											),
											//color: getContainerColor(model.DicSign.elementAt(0)),
											width: 45,
											height: 25,
											decoration: BoxDecoration(
															border: Border.all(color:  Color(0xFFEEEEEE)),
															borderRadius: BorderRadius.all(Radius.circular(5))
											),
										),
										SizedBox(
											width: padding,
										),
										Container(
											child: Center(
												child: Text(model.DicSign.elementAt(1).Key),
											),
											//color: getContainerColor(model.DicSign.elementAt(1)),
											width: 45,
											height: 25,
											decoration: BoxDecoration(
															border: Border.all(color:  Color(0xFFEEEEEE)),
															borderRadius: BorderRadius.all(Radius.circular(5))
											),
										),
										SizedBox(
											width: padding,
										),
										Container(
											child: Center(
												child: Text(model.DicSign.elementAt(2).Key),
											),
											//color: getContainerColor(model.DicSign.elementAt(2)),
											width: 45,
											height: 25,
											decoration: BoxDecoration(
															border: Border.all(color:  Color(0xFFEEEEEE)),
															borderRadius: BorderRadius.all(Radius.circular(5))
											),
										),
										SizedBox(
											width: padding,
										),
										Container(
											child: Center(
												child: Text(model.DicSign.elementAt(3).Key),
											),
											//color: getContainerColor(model.DicSign.elementAt(3)),
											width: 45,
											height: 25,
											decoration: BoxDecoration(
															border: Border.all(color:  Color(0xFFEEEEEE)),
															borderRadius: BorderRadius.all(Radius.circular(5))
											),
										),
										SizedBox(
											width: padding,
										),
										Container(
											child: Center(
												child: Text(model.DicSign.elementAt(4).Key,textAlign: TextAlign.center,),
											),
											//color: getContainerColor(model.DicSign.elementAt(4)),
											width: 45,
											height: 25,
											decoration: BoxDecoration(
															border: Border.all(color:  Color(0xFFEEEEEE)),
															borderRadius: BorderRadius.all(Radius.circular(5))
											),
										),
										SizedBox(
											width: 10,
										),
									],
								),
							),
							Container(
								height: 40 ,
								child: Row(
									children: [
										SizedBox(
											width: 8,
										),
										Container(
											child: Center(
												child: Text(model.DicSign.elementAt(5).Key),
											),
											//color: getContainerColor(model.DicSign.elementAt(5)),
											width: 45,
											height: 25,
											decoration: BoxDecoration(
															border: Border.all(color:  Color(0xFFEEEEEE)),
															borderRadius: BorderRadius.all(Radius.circular(5))
											),
										),
										SizedBox(
											width: padding,
										),
										Container(
											child: Center(
												child: Text(model.DicSign.elementAt(6).Key),
											),
											//color: getContainerColor(model.DicSign.elementAt(6)),
											width: 45,
											height: 25,
											decoration: BoxDecoration(
															border: Border.all(color:  Color(0xFFEEEEEE)),
															borderRadius: BorderRadius.all(Radius.circular(5))
											),
										)
									],
								),

							)


						],
					),
				),

			],

		);

	}

	Widget showInputText (BuildContext context ,String title,String hintText,String labelText,int index){

		final size = MediaQuery.of(context).size;

		return Row(

			children: [

				Container(
					width: 80,
					height: 40,
					padding: EdgeInsets.only(left: 5),
					//color: Colors.red,
					child: Center(
						child: Text('${title}',style: TextStyle(fontSize: 13,color: Colors.black),textAlign: TextAlign.center,),
					),
				),
				GestureDetector(
					onTap: (){

						if(index == 3){
							showPickerDateTime(context,1);

						}
					},
					child: Container(
						width: size.width - 85,
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

							}
							);
						},
						onSelect: (Picker picker, int index, List<int> selecteds) {

						}
		).show(_scaffoldKey.currentState);
	}
	@override
  void initState() {
    // TODO: implement initState
		getData();
    super.initState();
  }
	getData()async{

		AttendanceApplyModel attendanceApplyModel;
		await SpUtil.getInstance();
		String AppTicket = SpUtil.getString('AppTicket');
		LogUtil.d(AppTicket);
		int userId = SpUtil.getInt('userID');
		Dio dio = Dio();
		dio.options.headers['ticket'] = AppTicket;
		await dio.get('http://218.12.25.203:8008/api/app/AttendaceLoad?',queryParameters: {'userid':userId}).then((value) => {
			LogUtil.d('考勤申报:${value}'),
			attendanceApplyModel = AttendanceApplyModel.fromMap(value.data['result']),



		});
		setState(() {
		  model = attendanceApplyModel;
		});
	}
	@override
	Widget build(BuildContext context) {
		//final AttendaceApplyBloc bloc = BlocProvider.of<AttendaceApplyBloc>(context);
		//bloc.AttendanceLoad();
		SpUtil.getInstance();
		Map loginModel = SpUtil.getObject('loginModel');
		username = loginModel['userName'];

		// TODO: implement build
		return Scaffold(
			key: _scaffoldKey,
			appBar: AppBar(
				title: Text('考勤申报'),
				centerTitle: true,
			),
			body: Column(

				children: [
					showInputText(context, '姓       名', null, username == null ? null :username, 1),
					ApplyStateWidget(context, model),
					Container(
						padding: EdgeInsets.only(left: 10),
						child: Text(
							'*请正确填报考勤科目\n*如需添加同类更多的费用，请编辑好后单击添加按钮，系统会自动生成一个费用清单显示在下方\n*工作状态由默认工作更改为工作、周末公休、法定节假日放假三种状态，不可编辑\n*地区由默认地区更改为手动选择，请点击保存按钮时务必手动选择工作地区\n*因新系统调整了筛选工程的逻辑，需要项目经理配合添加项目组和立项信息同时将人员加入项目组或者自己去领单界面去领取工作量,之后即可在考勤看到对应的工程信息',
							style: TextStyle(color: Colors.red,fontSize: 12),
							maxLines: 11,



						),
					),
					showInputText(context, '申报日期', '选择申报日期', applyDate == null ? null :applyDate, 3),
					showInputText(context, '工作状态', '请选择', null, 4),
					showInputText(context, '地        区', '外勤通签到地区', null, 5),
					showInputText(context, '简述工作概要', '填写工作概要',null , 6),
					showInputText(context, '项目组', '请选择', '1234', 7),
					showInputText(context, '项目组所在地市', null, null, 8),
					showInputText(context, '项目名', '请选择', '1234', 9),
					showInputText(context, '工程名', '请选择', '1234', 10),

				],
			)
		);
	}



}
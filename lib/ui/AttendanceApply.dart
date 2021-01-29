


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttendanceApply extends StatefulWidget{

	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AttendanceApplyState();
  }

}
class _AttendanceApplyState extends State<AttendanceApply>{

	@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
			appBar: AppBar(
				title: Text('考勤申报'),
				centerTitle: true,
			),
			body: Center(
				child: Text('123'),
			),
		);
  }

}
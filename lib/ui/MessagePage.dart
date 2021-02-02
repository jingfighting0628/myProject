

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget{
	@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
			appBar: AppBar(
				title: Text('消息列表'),
				centerTitle: true,
			),
			body: Center(
				child: Text('消息列表'),
			),
		);
  }
}
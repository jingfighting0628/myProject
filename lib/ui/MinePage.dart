

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我'),
        centerTitle: true,
          leading: Container(
            child: null,
          )
      ),
      body: Center(
        child: Text('123'),
      ),
    );
  }
}
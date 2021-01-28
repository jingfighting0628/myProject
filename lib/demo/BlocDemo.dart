


import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDemo extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
       title: 'Streams Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home:BlocProvider<IncrementBloc>(
        child: CounterPage(),
        bloc: IncrementBloc(),
      )
    );
  }
}
class CounterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final IncrementBloc bloc = BlocProvider.of(context);


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream version of the Counter App'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.outCounter,
          initialData: 0,
         builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            return Text('You hit me: ${snapshot.data} times');
         },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          bloc.incrementCounter.add(null);
        },
      ),
    );
  }
}
class IncrementBloc implements BlocBase{

  int _counter ;

  StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;
  
  IncrementBloc(){
    _counter = 0;
    _actionController.stream.listen((event) {
      _counter = _counter + 1;
      _inAdd.add(_counter);
    });


  }

  void dispose(){
    _actionController.close();
    _counterController.close();
  }


}


abstract class BlocBase{

  void dispose();
}


class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context){
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
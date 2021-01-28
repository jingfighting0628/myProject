import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app/bloc/bloc_provider.dart';
class ApplicationBloc implements BlocBase {
  BehaviorSubject<int> _appEvent = BehaviorSubject<int>();

  Sink<int> get _appEventSink => _appEvent.sink;

  Stream<int> get appEventStream => _appEvent.stream;

  @override
  void dispose() {
    _appEvent.close();
  }

  @override
  Future getHomeData() {
    // TODO: implement getHomeData
    return null;
  }

}

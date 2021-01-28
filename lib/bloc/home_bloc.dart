
import 'package:flutter_app/bloc/bloc_provider.dart';
import 'package:flutter_app/model/homeModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app/repository/WanRepository.dart';
class homeBloc implements BlocBase{

  BehaviorSubject<HomeModel> _home = BehaviorSubject<HomeModel>();

  Sink<HomeModel> get _homeSink => _home.sink;
  Stream<HomeModel> get homeStream => _home.stream;


  @override
  Future getHomeData() async {
    // TODO: implement getHomeData
    WanRepository().getHomeData().then((value) =>

         _homeSink.add(value),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose

  }



}
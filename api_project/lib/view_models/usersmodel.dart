import '../models/model.dart';
import '../services/modelAPI.dart';
import 'package:flutter/widgets.dart';

enum NewState{
  Initial,
  Loading,
  Loaded,
  Error,
}
class UsersModel extends ChangeNotifier{
  NewState _newState =NewState.Initial;
  List<Users> _list = [];
  String message ='';
  UsersModel(){
    _fetchUsers();
  }
  NewState get newState => _newState;
  Future<void> _fetchUsers() async{
    _newState =NewState.Loading;
    try{
      await Future.delayed(Duration(seconds: 5));
      _newState =NewState.Loaded;
    }
    catch (e) {
      message ='$e';
      _newState  =NewState.Error;
    }
    notifyListeners();
  }
}
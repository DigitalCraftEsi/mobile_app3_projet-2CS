import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:mobile3/Data/Services/UserInfosService.dart';



class UserInfosBloc extends ChangeNotifier {
  Map<String,dynamic> _data = {};

  Map<String,dynamic> get data => _data;
  Future<void> getUserInfos() async {
    _data= await UserInfosService.GetUserInfos();
    print(_data);
    notifyListeners();
  }

  Future<void> setUserInfos(File? picture, String email) async {
    _data= await UserInfosService.SetUserInfos(picture: picture, email: email);
    notifyListeners();
  }

  Future<void> setPassword(String password) async {
    _data= await UserInfosService.SetPassword(password: password);
    notifyListeners();
  }
}
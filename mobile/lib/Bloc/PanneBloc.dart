import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:mobile3/Data/Services/PanneService.dart';



class PanneBloc extends ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String,dynamic> get data => _data;
  Future<void> GetPanne() async {
    _data= await PanneService.GetPanne();
    print(_data);
    notifyListeners();
  }
}
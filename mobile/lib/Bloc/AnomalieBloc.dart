import 'dart:io';
import 'package:flutter/foundation.dart';
import '../Data/Services/AnomalieService.dart';



class AnomalieBloc extends ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String,dynamic> get data => _data;
  Future<void> GetAnomalie() async {
    _data= await AnomalieService.GetAnomalie();
    print(_data);
    notifyListeners();
  }
}
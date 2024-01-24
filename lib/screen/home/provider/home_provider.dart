import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier{
  bool isColor=true;

  void changImage(bool color){
    isColor = color;
    notifyListeners();
  }
}
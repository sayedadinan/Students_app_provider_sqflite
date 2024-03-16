import 'package:flutter/material.dart';

class Studentaddcontrol extends ChangeNotifier {
  String imagepath = '';
  bool imageerror = false;
  bool isimageselected = false;
  notifyListeners();
  void initialize() {
    imagepath = '';
    imageerror = false;
    isimageselected = false;
    notifyListeners();
  }

  addimage(String imagepaths) {
    imagepath = imagepaths;
    notifyListeners();
  }
}

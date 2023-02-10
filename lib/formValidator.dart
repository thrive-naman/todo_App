import 'package:flutter/material.dart';

class FieldValidator extends ChangeNotifier {
  TitleValidation _title = TitleValidation(null, null);

// Getter
  TitleValidation get title => _title;

  // isValid(String str) {
  //   _title = str.isEmpty
  //       ? TitleValidation(null, 'Title Should not be empty')
  //       : TitleValidation(str, null);
  //   notifyListeners();

  //   // return _title.errror == null ? true : false;
  // }

// Setter
  void changeTitle(String value) {
    if (value.isEmpty) {
      _title = TitleValidation(null, 'Title Should not be empty');
    } else {
      _title = TitleValidation(value, null);
    }
    notifyListeners();
  }
}

class TitleValidation {
  final String? title, errror;

  TitleValidation(this.title, this.errror);
}

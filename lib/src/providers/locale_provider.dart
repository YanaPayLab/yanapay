import 'package:flutter/material.dart';
 

class LocaleProvider with ChangeNotifier{
  Locale? _locale;
  Locale? get locale => _locale;
  set locale (Locale? val){
    _locale = val;
    notifyListeners();
  }

  void clearLocale(){
    _locale=null;
    notifyListeners();
  }

}

import 'package:flutter/material.dart';

import 'models/User.dart';

class UserHelper with ChangeNotifier{
  bool isLogged = false;
    late User currentUser;

    login(){
      isLogged = true;
      notifyListeners();
    }


}
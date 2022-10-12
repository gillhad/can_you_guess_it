import 'package:can_you_guess_it/screens/blank_display.dart';
import 'package:can_you_guess_it/screens/login.dart';
import 'package:flutter/material.dart';

import 'navigationroutes.dart';

class AppRoutes{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case NavigationRoutes.home:
        return MaterialPageRoute(builder: (context){
          return Login();
        });
      default:
        return MaterialPageRoute(builder: (context){
          return BlankDisplay();
        });
    }
  }
}
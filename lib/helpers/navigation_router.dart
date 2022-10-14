import 'package:can_you_guess_it/helpers/arguments/arguments.dart';
import 'package:can_you_guess_it/screens/blank_display.dart';
import 'package:can_you_guess_it/screens/game_screen.dart';
import 'package:can_you_guess_it/screens/home.dart';
import 'package:can_you_guess_it/screens/login.dart';
import 'package:can_you_guess_it/screens/register.dart';
import 'package:flutter/material.dart';

import 'navigationroutes.dart';

class AppRoutes{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case NavigationRoutes.login:
        return MaterialPageRoute(builder: (context){
          return Login();
        });
        case NavigationRoutes.register:
        return MaterialPageRoute(builder: (context){
          return Register();
        });
        case NavigationRoutes.home:
        return MaterialPageRoute(builder: (context){
          return Home();
        });
        case NavigationRoutes.game:
        return MaterialPageRoute(builder: (context){
          final arguments = settings.arguments as GameArguments;
          return GameScreen(
            gameMode: arguments.gamemode,
          );
        });
      default:
        return MaterialPageRoute(builder: (context){
          return BlankDisplay();
        });
    }
  }
}
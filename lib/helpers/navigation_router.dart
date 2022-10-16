import 'package:can_you_guess_it/helpers/arguments/arguments.dart';
import 'package:can_you_guess_it/screens/blank_display.dart';
import 'package:can_you_guess_it/screens/game_finished.dart';
import 'package:can_you_guess_it/screens/game_screen.dart';
import 'package:can_you_guess_it/screens/home.dart';
import 'package:can_you_guess_it/screens/login.dart';
import 'package:can_you_guess_it/screens/profile/friends.dart';
import 'package:can_you_guess_it/screens/profile/rankings.dart';
import 'package:can_you_guess_it/screens/register.dart';
import 'package:flutter/material.dart';

import '../screens/profile/avatar.dart';
import '../screens/profile/profile.dart';
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
        case NavigationRoutes.finish:
        return MaterialPageRoute(builder: (context){
          final arguments = settings.arguments as GameFinishedArguments;
          return GameFinished(
              gameMode: arguments.gameMode,
            points: arguments.points,
            datetime: arguments.datetime,
            callback: arguments.callback,
          );
        });
      case NavigationRoutes.profile:
        return MaterialPageRoute(builder: (context){
          return Profile(
          );
        });
      case NavigationRoutes.avatar:
        return MaterialPageRoute(builder: (context){
          return Avatar(
          );
        });
      case NavigationRoutes.ranking:
        return MaterialPageRoute(builder: (context){
          return Rankings(
          );
        });
      case NavigationRoutes.friends:
        return MaterialPageRoute(builder: (context){
          return Friends(
          );
        });
      default:
        return MaterialPageRoute(builder: (context){
          return BlankDisplay();
        });
    }
  }
}
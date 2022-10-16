import 'package:can_you_guess_it/helpers/models/enums.dart';

class GameArguments{
  GameModes gamemode;
  Function? callback;

  GameArguments({required this.gamemode, this.callback});
}

class GameFinishedArguments{
  final int points;
  final GameModes gameMode;
  final DateTime? datetime;
  Function? callback;

  GameFinishedArguments({required this.points, required this.gameMode, this.datetime, this.callback});

}
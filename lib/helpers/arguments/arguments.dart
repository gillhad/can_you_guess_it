import 'package:can_you_guess_it/helpers/models/enums.dart';

class GameArguments{
  GameModes gamemode;
  Function? callback;

  GameArguments({required this.gamemode, this.callback});
}
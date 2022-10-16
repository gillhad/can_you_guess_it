import 'package:can_you_guess_it/helpers/arguments/arguments.dart';
import 'package:can_you_guess_it/helpers/data_mock.dart';
import 'package:can_you_guess_it/helpers/models/enums.dart';
import 'package:can_you_guess_it/helpers/navigationroutes.dart';
import 'package:flutter/material.dart';

import '../helpers/models/User.dart';

class GameFinished extends StatefulWidget {
  const GameFinished(
      {Key? key,
      required this.points,
      required this.gameMode,
      this.datetime,
      this.callback})
      : super(key: key);

  final int points;
  final GameModes gameMode;
  final DateTime? datetime;
  final Function? callback;

  @override
  State<GameFinished> createState() => _GameFinishedState();
}

class _GameFinishedState extends State<GameFinished> {
  late User _currentUser;
  late int _gameModeIndex;
  late double _width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentUser = MockData.testUser;
    GameModes.values.forEach((element) {
      print(element.name);
      _gameModeIndex = element.index;
    });

    if(widget.points > _currentUser.points!.elementAt(_gameModeIndex).points){
      //update base de datos
      _currentUser.points!.elementAt(_gameModeIndex).points = widget.points;
    }
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    print(_width);

    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Widget _body() {
    return Stack(children: [
      Container(
        width: _width,
        child: Column(
          children: [
            _bigMessage(),
            _pointShow(),
            _previousPoints(),
            _gameModeText(),

          ],
        ),
      ),
      _finishOptions()
    ]);
  }

  Widget _bigMessage() {
    return Container(
      margin: EdgeInsets.only(top: 45,bottom: 45),
      child: Text("Buen trabajo", style: TextStyle(fontSize: 48),),
    );
  }

  Widget _pointShow() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Text("TU PUNTUACIÓN ES"),
          SizedBox(height: 10,),
          Text(widget.points.toString()),
        ],
      ),
    );
  }

  Widget _previousPoints() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            widget.points > _currentUser.points!.elementAt(_gameModeIndex).points
            ? Text("Nuevo record!")
                : Text("Mejor Puntuación!"),
            Text(_currentUser.points!.elementAt(_gameModeIndex).points.toString()),
          ],
        ));
  }

  Widget _gameModeText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(widget.gameMode.name),
    );
  }

  Widget _finishOptions() {
    return Positioned(
      bottom: 50,
      child: Container(
        width: _width,
        padding: EdgeInsets.symmetric(horizontal: _width/6),
        child: Row(
          children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      _navigationHome();
                    },
                    icon: Icon(Icons.arrow_back)),
                Text("BACK TO MENU")
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      _navigationReplay();
                    },
                    icon: Icon(
                      Icons.replay,
                    )),
                Text("REPLAY")
              ],
            ),
          ],
        ),
      ),
    );
  }

  _navigationHome(){
   Navigator.pushReplacementNamed(context, NavigationRoutes.home);
  }

  _navigationReplay(){
   Navigator.pushReplacementNamed(context, NavigationRoutes.game, arguments: GameArguments(gamemode: widget.gameMode));
  }
}

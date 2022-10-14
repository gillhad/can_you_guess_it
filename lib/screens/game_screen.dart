import 'dart:async';

import 'package:can_you_guess_it/helpers/data_moch.dart';
import 'package:can_you_guess_it/helpers/models/enums.dart';
import 'package:flutter/material.dart';

import '../helpers/models/models.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, required this.gameMode}) : super(key: key);

  final GameModes gameMode;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _points = 0;

  late List<Country> _currentPool = [MockData.randomCountry,MockData.randomCountry,MockData.randomCountry];
  late Country _currentCountry = MockData.randomCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar(){
    return AppBar();
  }

  Widget _body(){
    return Container(child:
    Column(
      children: [
        _gameStats(),
        _currentFlagShow(),
        _optionsPanel(),
      ]
    ));
  }

  Widget _gameStats(){
    return Container(
      padding: EdgeInsets.all(18),
    child: Row(
      children: [
        _time(),
        Spacer(),
        _pointsManager(),
      ],
    ),
    );
  }

  Widget _time(){
    return Container(
      child: Text("000")
    );
  }

  Widget _pointsManager(){
    return Container(
      child: Text(_points.toString()),
    );
  }

  Widget _currentFlagShow(){
    return Container(

    );
  }
  Widget _optionsPanel(){
    return Container(
    );
  }

  Widget _option(){
    return Container(
      child: GestureDetector(
        onTap: (){

        },
        child: Text("opciones"),
      ),
    );
  }

}

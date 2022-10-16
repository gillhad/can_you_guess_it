import 'dart:async';
import 'dart:math';

import 'package:can_you_guess_it/helpers/app_theme.dart';
import 'package:can_you_guess_it/helpers/arguments/arguments.dart';
import 'package:can_you_guess_it/helpers/data_mock.dart';
import 'package:can_you_guess_it/helpers/models/enums.dart';
import 'package:can_you_guess_it/helpers/navigationroutes.dart';
import 'package:flutter/material.dart';

import '../helpers/models/models.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, required this.gameMode, this.continent}) : super(key: key);

  final GameModes gameMode;
  final String? continent;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _points = 0;
  late double _width;
  late double _height;
  late double _timerWidth;
  bool _correctAnswer = false;

  List<Color> _optionColors = [AppThemeCustom.SecondaryColorDark,AppThemeCustom.SecondaryColorDark,AppThemeCustom.SecondaryColorDark,AppThemeCustom.SecondaryColorDark,];

  late List<Country> _allCountries = MockData.fourCountries;
  late List<Country> _currentPool = MockData.fourCountries;
  late List<Country> _currentOptions = MockData.fourCountries;
  late Country _currentCountry = MockData.randomCountry;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPool = _getRandomFlags();
    _getCurrentCountry();
  }

  callback(){

  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    //_timerWidth = MediaQuery.of(context).size.width/2;
    _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar(){
    return AppBar(
      title: widget.continent!= null
          ? Text("${widget.gameMode.name} ${widget.continent} ")
      : Text("${widget.gameMode.name}"),
    );
  }

  Widget _body(){
    return Container(child:
    Column(
      children: [
        _gameStats(),
        _currentFlagShow(),
        _optionsPanel(setState),
        //_timer(),
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
      height: _height/3,
      color: Colors.red,
      child: Text(_currentCountry.name),
    );
  }
  Widget _optionsPanel(StateSetter setState){
    return Container(
      height: _height/3,
      width: _width/1.5,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40),
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index){
        return _option(index);
      }),
    );
  }

  Widget _option(int index){
    Color currentColor = AppThemeCustom.SecondaryColor;
    return GestureDetector(
      onTap: (){
        print("object $index");
        setState((){
          _optionColors[index] = _checkSelection(_currentOptions[index], currentColor);
          if(_correctAnswer){
            Timer(Duration(milliseconds: 500), _resetOptions);
          }
        });
      },
      child: Container(
        height: _height/20,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: _optionColors[index],
        borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          child: Text(_currentOptions[index].name,
          style: TextStyle(color: Colors.red),)),
    );
  }

  // Widget _timer(){
  //   double width = 200;
  //   return AnimatedContainer(
  //       duration: Duration(seconds: 5),
  //       width: width,
  //     height: 10,
  //     color: Colors.red,
  //
  //   );
  // }

  Color _checkSelection(Country country, Color currentColor){
  if(_currentCountry == country){
    print("correcto");
    _correctAnswer = true;
    return Colors.green;
  }else{
    print("incorrecto");
    return Colors.red;
  }
  }

  _getCurrentCountry(){
    if(_currentPool.length > 1){
      var randomValue = Random().nextInt(_currentPool.length-1);
      _currentCountry = _currentPool[randomValue];
    }else{
      _currentCountry = _currentPool[0];
    }
  }

  List<Country> _getRandomFlags(){
    List<Country> _randomFlags =[];
    _currentOptions.shuffle();
    print(_currentOptions.length);
    _currentOptions.forEach((element) {
      print(element.name);
    });
    _randomFlags.add(_currentOptions[0]);
    _randomFlags.add(_currentOptions[1]);
    _randomFlags.add(_currentOptions[2]);
    _randomFlags.add(_currentOptions[3]);
    return _randomFlags; 
  }

  _removeFlag(){
    _currentPool.remove(_currentCountry);
  }

  _resetOptions(){
    _correctAnswer = false;
    _optionColors = [AppThemeCustom.SecondaryColorDark,AppThemeCustom.SecondaryColorDark,AppThemeCustom.SecondaryColorDark,AppThemeCustom.SecondaryColorDark,];
    _removeFlag();
    setState((){
      if(_currentPool.isNotEmpty) {
        _getCurrentCountry();
        _getRandomFlags();
        _currentPool.forEach((element) {
          print(element.name);
        });
      }else{
        ///todo mensaje de ganar

        print("has faking ganado");
        _navigationFinish();
      }
    });
  }

_navigationFinish(){
    Navigator.pushNamed(context, NavigationRoutes.finish, arguments: GameFinishedArguments(points: _points, gameMode: widget.gameMode, callback: callback));
}

}

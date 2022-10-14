import 'package:can_you_guess_it/helpers/app_theme.dart';
import 'package:can_you_guess_it/helpers/models/enums.dart';
import 'package:can_you_guess_it/helpers/navigation_router.dart';
import 'package:can_you_guess_it/helpers/navigationroutes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double _buttonWidth;
  late double _width;
  late double _heigth;

  GameModes _gameMode = GameModes.GLOBAL;
  List<GameModes> _gameModes = [GameModes.GLOBAL,GameModes.CONTINENT, GameModes.MAPS];
  List<Continents> _continents = [Continents.AFRICA, Continents.AMERICA, Continents.ASIA, Continents.EUROPE, Continents.OCEANIA];
  int _continentIndex = 0;
  Continents _currentContinent = Continents.AFRICA;

  @override
  Widget build(BuildContext context) {
     _buttonWidth = MediaQuery.of(context).size.width/2;
     _width = MediaQuery.of(context).size.width;
     _heigth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar(){
    return AppBar(
      title: Text("Guess IT"),
    );
  }

  Widget _body(){
    return Column(
      children: [
        _gameModeTitle(),
        _image(),
        _startButton(),
        _modeButton(),
        _optionButton(),
        _profileButton(),
      ],
    );
  }

  Widget _gameModeTitle(){
    return Container(
      margin: EdgeInsets.all(18),
      child: Text(_gameMode.name.toString(),
      style: TextStyle(
        fontSize: 24,
        color: AppThemeCustom.PrimaryColorDark
      ),),
    );
  }

  Widget _image(){
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height/3,
      child: Row(
        children: [
          _gameMode != GameModes.GLOBAL
              ?     _arrowNavigation(-1, setState)
            : Container(
            width: _width/5,
          ),
          Container(
            width: _width*3/5,
    child: Text(_currentContinent.name.toString(), style: TextStyle(color: AppThemeCustom.PrimaryColorDark),)
          ),
          _gameMode != GameModes.GLOBAL
              ? _arrowNavigation(1, setState)
          : Container(
            width: _width/5,
          )
          ,
        ],
      ),
    );
  }

  Widget _startButton(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30),
      child: Container(
        width: _buttonWidth,
        child: ElevatedButton(
          onPressed: (){},
          child: Text("START"),
        ),
      ),
    );
  }

  Widget _modeButton(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 15),
      child: Container(
        width: _buttonWidth,
        child: ElevatedButton(
          onPressed: (){
            setState((){
              _currentGameMode();
            });
          },
          child: Text("MODE"),
        ),
      ),
    );
  }

  Widget _optionButton(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 15),
      child: Container(
        width: _buttonWidth,
        child: ElevatedButton(
          onPressed: (){

          },
          child: Text("OPTIONS"),
        ),
      ),
    );
  }

  Widget _profileButton(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 15),
      child: Container(
        width: _buttonWidth,
        child: ElevatedButton(
          onPressed: (){
            _profileNavigation();
          },
          child: Text("PROFILE"),
        ),
      ),
    );
  }


  ///select current gameMode
  _currentGameMode(){
  print(_gameMode.toString());
  setState((){
    if(_gameMode == _gameModes.last){
      _gameMode = _gameModes.first;
      _currentContinent = _continents[0];
    }else{
      int currentMode = _gameModes.indexOf(_gameMode);
      currentMode ++;
      _gameMode = _gameModes[currentMode];
      _currentContinent = _continents[0];
    }
  });

  }

  Widget _arrowNavigation(int calc, StateSetter state){
    return GestureDetector(
      onTap: (){
        state((){
          print(_continentIndex);
          _continentIndex += calc;
           if(_continentIndex == _continents.length){
             print("valor max");
             _continentIndex = 0;_currentContinent = _continents[_continentIndex];

           }else if(_continentIndex < 0){
             _continentIndex = _continents.length-1;
             _currentContinent = _continents[_continentIndex];
          }else{
             print("valor otro");
             _currentContinent = _continents[_continentIndex];
           }
        });
      },
      child: Container(
        color: Colors.red,
        width: _width/5,
        //todo añadir imagen segun +1 o -1, mayor o menor que
      ),);
  }

  ///Navigation
  _startNavigation(){
    Navigator.pushNamed(context, NavigationRoutes.game);
  }
  _optionsNavigation(){
    Navigator.pushNamed(context, NavigationRoutes.game);
  }
  _profileNavigation(){
    Navigator.pushNamed(context, NavigationRoutes.game);
  }

}

import 'package:can_you_guess_it/helpers/app_theme.dart';
import 'package:flutter/material.dart';

import '../../helpers/models/enums.dart';

class Rankings extends StatefulWidget {
  const Rankings({Key? key}) : super(key: key);

  @override
  State<Rankings> createState() => _RankingsState();
}

class _RankingsState extends State<Rankings> {
  int _selectedTab = 0;
  int _currentGameMode = 0;
  late double _height;
  late double _width;

  static List<Widget> _widgetOptions = [];
  static List<GameModes> _gameModes = [GameModes.FLAGS, GameModes.MAPS];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    _widgetOptions = <Widget>[
      _global(),
      _friends(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Global"),
          BottomNavigationBarItem(icon: Icon(Icons.remove), label: "Friends")
        ],
        currentIndex: _selectedTab,
        onTap: _onNavSelected,
      ),
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Widget _body() {
    return Column(
      children: [
        _gameModeShow(),
        _widgetOptions[_selectedTab],
      ],
    );
  }

  Widget _global() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          height: _height/1.2,
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context,index){
            return _listItems(index);
          }),
        ),
      ),
    );
  }

  Widget _friends() {
    return Container();
  }

  Widget _listItems(int index){
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(5),
    height: 30,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
        width: _width/1.5,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppThemeCustom.SecondaryColorDark,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(index.toString()),
            Spacer(),
            Text("username"),
            Spacer(),
            Text("points")
          ],
        )),
  );
  }

  Widget _gameModeShow() {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              height: 70,
              width: _width,
              alignment: Alignment.center,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                  itemBuilder: (context,index){
                    return _gameModesOptions(index);
                  })
            ),
          ),
        ),
      ],
    );
  }

  Widget _gameModesOptions(int index){
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
          onPressed: (){},
          child: Text(index.toString())),
    );
  }

  _onNavSelected(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
}

import 'package:flutter/material.dart';

import '../../helpers/app_theme.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  late double _width;
  late double _height;

  List<String> _avatarimages = ["1","1","1","1","1","1","1","1","1","1",];
  int? _avatarSelected;


  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;



    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar(){
    return AppBar(
      title: Text("Avatar"),
    );
  }

  Widget _body(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children:[
        _currentAvatar(),
        _listAvatar(),
        _updateButton(),
      ]

    );
  }

  Widget _currentAvatar(){
    return Container(
      height: _height/6,
      margin: EdgeInsets.only(top: 30, bottom: 30),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppThemeCustom.SecondaryColorDark
        ),
      ),
    );
  }

  Widget _listAvatar(){
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          height: _height/2.75,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 40),
            shrinkWrap: true,
              itemCount: _avatarimages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
          ),
              itemBuilder: (context,index){
            return _avatarShow(index);
              }),
        ),
      ),
    );
  }

  Widget _avatarShow(int index){

    return GestureDetector(
      onTap: (){
        setState((){
          _avatarSelected = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: index == _avatarSelected
              ?  Colors.green.withOpacity(0.5)
              : Colors.green,
          shape: BoxShape.circle
        ),
        child: Text(_avatarimages[index]),
      ),
    );
  }

  Widget _updateButton(){
    return Container(
      width:  _width/2,
      margin: EdgeInsets.only(bottom: 30),
      child: ElevatedButton(
        onPressed:(){
          
        } ,
        child: Text("actualizar") ,
      ),
    );
  }
}


import 'package:can_you_guess_it/helpers/app_theme.dart';
import 'package:can_you_guess_it/helpers/navigationroutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/models/User.dart';
import '../../helpers/user_helper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double _widht;
  late double _height;
  late User _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser =  Provider.of<UserHelper>(context, listen: false).currentUser;
  }

  @override
  Widget build(BuildContext context) {
    _widht = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text("Profile"),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _avatar(),
        _name(),
        _friends(),
        _ranking(),
        _best(),
        _logOutButton( )
      ]

    );
  }

  Widget _avatar() {
    return Container(
      height: _height/5,
      margin: EdgeInsets.only(top: _height/10, bottom: _height/20),
      child: GestureDetector(
        onTap: (){
          _avatarNavigation();
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppThemeCustom.SecondaryColorDark
          ),
        ),
      ),
    );
  }

  Widget _name() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Text(_currentUser.name!, style: TextStyle(fontSize: 24),),
    );
  }

  Widget _ranking() {
    return Container(
      width: _widht/2,
      margin: EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: (){
          _rankingNavigtaion();
        },
        child: Text("Ranking"),
      ),
    );
  }

  Widget _best() {
    return Container(
      width: _widht/2,
      margin: EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: (){},
        child: Text("Best"),
      ),
    );
  }


  Widget _friends() {
    return Container(
      width: _widht/2,
      margin: EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: (){
          _friendsNavigation();
        },
        child: Text("Friends"),
      ),
    );
  }
  Widget _logOutButton() {
    return Container(
      width: _widht/2,
      child: ElevatedButton(
        child: Text("logout"),
        onPressed: (){},
      ),
    );
  }


  ///navigations
  _avatarNavigation(){
    Navigator.pushNamed(context, NavigationRoutes.avatar);
  }

  _rankingNavigtaion(){
    Navigator.pushNamed(context, NavigationRoutes.ranking);
  }

  _friendsNavigation(){
  Navigator.pushNamed(context, NavigationRoutes.friends);
  }

  _bestNavigation(){

  }

  _logout(){

  }
}



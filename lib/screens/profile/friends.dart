import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  late double _height;
  late double _width;
  
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar(){
    return AppBar(
      title: Text("Friends"),
    );
  }

  Widget _body(){
    return Column(
      children:[
        //_searchBar(),
        _friendList(),
      ]

    );
  }

  // Widget _searchBar(){
  //   return AnimatedContainer(
  //     height: 60,
  //     width: _width,
  //     padding: EdgeInsets.all(8),
  //     duration: Duration(seconds: 3),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //             color: Colors.green,
  //       ),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           SizedBox(
  //               width: _width/1.3,
  //               child: TextFormField(
  //                 decoration: InputDecoration(
  //                   suffixIcon: Icon(Icons.search),
  //                 ),
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _friendList(){
    return Container();
  }
}

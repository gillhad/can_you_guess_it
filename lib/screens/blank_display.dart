import 'package:flutter/material.dart';

class BlankDisplay extends StatelessWidget {
  const BlankDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }

  AppBar _appBar(){
    return AppBar(
      title: Text("Ooops"),
    );
  }
}

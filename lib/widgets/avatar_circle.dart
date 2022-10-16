import 'package:flutter/material.dart';

class AvatarIcon extends StatefulWidget {
  const AvatarIcon({Key? key}) : super(key: key);

  @override
  State<AvatarIcon> createState() => _AvatarIconState();
}

class _AvatarIconState extends State<AvatarIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle
      ),
    );
  }
}

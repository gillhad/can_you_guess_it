import 'package:can_you_guess_it/helpers/app_theme.dart';
import 'package:can_you_guess_it/helpers/validators.dart';
import 'package:flutter/material.dart';

class WidgetCollection{

static Container textFormField(String title,TextEditingController _controller, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width/1.5,
    margin: EdgeInsets.only(top: 10),
    child: TextFormField(
      controller: _controller,
    validator: (value) => Validators.textValidator(_controller.text, title),
    style: TextStyle(color: AppThemeCustom.PrimaryColorLight),
    decoration: InputDecoration(
      labelText: title,
    ),
    ),
  );
}

static Container mailFormField(String title,TextEditingController _controller, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width/1.5,
    margin: EdgeInsets.only(top: 10),
    child: TextFormField(
      controller: _controller,
      validator: (value) => Validators.mailValidator(_controller.text, title),
      style: TextStyle(color: AppThemeCustom.PrimaryColorLight),
      decoration: InputDecoration(
        labelText: title,
      ),
    ),
  );
}


static Container passFormField(String title, TextEditingController _controller, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width/1.5,
    margin: EdgeInsets.only(top: 10),
    child: TextFormField(
      controller: _controller,
      validator: (value) =>Validators.passValidator(_controller.text, title),
      style: TextStyle(color: AppThemeCustom.PrimaryColorLight),
      decoration: InputDecoration(
        labelText: title,
      ),
    ),
  );
}


}
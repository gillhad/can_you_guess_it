import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemeCustom {
  static const PrimaryColor = const Color(0xFF88D18A);
  static const PrimaryColorLight = const Color(0xFFCCDDB7);
  static const PrimaryColorDark = const Color(0xFF97777D);

  static const SecondaryColor = const Color(0xFF577399);
  static const SecondaryColorLight = const Color(0xFFe5ffff);
  static const SecondaryColorDark = const Color(0xFF82ada9);

  static const Background = const Color(0xffD77A61);
  static const TextColor = const Color(0xff495867);


  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,

      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: SecondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),

      scaffoldBackgroundColor: Background,
      cardColor: Background,
      textSelectionColor: PrimaryColorLight,
      backgroundColor: Background,

      textTheme: base.textTheme.copyWith(
          subtitle1: base.textTheme.subtitle1?.copyWith(color: TextColor),
          bodyText1: base.textTheme.bodyText1?.copyWith(color: TextColor),
          bodyText2: base.textTheme.bodyText2?.copyWith(color: TextColor)
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: SecondaryColor,
          primary: PrimaryColor,
          textStyle: TextStyle(
            color: SecondaryColor,
          fontSize: 18)
        )
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: PrimaryColor,


        )
      ),

        appBarTheme: AppBarTheme(
          color: PrimaryColor,
          titleTextStyle: TextStyle(color: PrimaryColorLight, fontSize: 18, fontWeight: FontWeight.bold),
          toolbarTextStyle: TextStyle(color: PrimaryColorLight),
          iconTheme: IconThemeData(
            color: SecondaryColor
          )

        ),

        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: PrimaryColorLight),
            hintStyle: TextStyle(color: PrimaryColorLight),
            filled: true,
            fillColor: AppThemeCustom.PrimaryColorLight.withOpacity(0.2),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 2,
              style: BorderStyle.solid,
              color: PrimaryColorLight
            )
          ),
            contentPadding: EdgeInsets.only(left: 10),
            errorStyle: TextStyle(fontSize: 10,height: 0.3),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppThemeCustom.PrimaryColorDark,
            width: 2,
          ),
        ),

    )

    );
  }
}
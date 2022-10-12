import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemeCustom {
  static const PrimaryColor = const Color(0xFFb71c1c);
  static const PrimaryColorLight = const Color(0xFFf05545);
  static const PrimaryColorDark = const Color(0xFF7f0000);

  static const SecondaryColor = const Color(0xFFb2dfdb);
  static const SecondaryColorLight = const Color(0xFFe5ffff);
  static const SecondaryColorDark = const Color(0xFF82ada9);

  static const Background = const Color(0xffc2af75);
  static const TextColor = const Color(0xFFffffff);


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
          primary: PrimaryColor
        )
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: PrimaryColor
        )
      )

    );
  }
}
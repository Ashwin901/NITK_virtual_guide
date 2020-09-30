import 'package:flutter/material.dart';
import 'constants.dart';

final darkTheme = ThemeData(
  tabBarTheme: TabBarTheme(
    labelStyle: textStyle.copyWith(color: Colors.white),
  ),
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
      color: Colors.black87,
      textTheme: TextTheme(
          headline6: textStyle.copyWith(color: Colors.white, fontSize: 23)),
      iconTheme: IconThemeData(
        color: Colors.white,
      )),
  cardColor: Colors.black54,
);

final lightTheme = ThemeData(
  tabBarTheme: TabBarTheme(
      labelStyle: textStyle.copyWith(
        color: Colors.black87,
      ),
      labelColor: Colors.black87),
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: TextTheme(
        headline6: textStyle.copyWith(color: Colors.black87, fontSize: 23),
      ),
      iconTheme: IconThemeData(color: Colors.black87)),
  cardColor: Colors.white,
);

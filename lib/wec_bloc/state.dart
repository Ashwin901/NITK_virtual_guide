import 'package:flutter/material.dart';


class GuideState{}

class InitState extends GuideState{}

class ChangeGuidePageState extends GuideState{
  String text;
  Color buttonColor;
  String imageLocation ;
  ChangeGuidePageState({this.text,this.buttonColor,this.imageLocation});
}

class ChangeThemeState extends GuideState{
  var theme;
  Color indicatorColor,container;
  ChangeThemeState({this.theme,this.indicatorColor,this.container});
}
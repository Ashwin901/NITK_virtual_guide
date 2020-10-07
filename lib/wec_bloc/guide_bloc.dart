import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:wec_guide/theme_options.dart';
import 'events.dart';
import 'state.dart';

class GuideBloc extends Bloc<GuideEvent, GuideState> {
  GuideBloc(GuideState initialState) : super(initialState);

  @override
  Stream<GuideState> mapEventToState(GuideEvent event) async* {
    // TODO: implement mapEventToState
    if (event is ChangeGuidePageEvent) {
      if (event.index == 2) {
        String text =
            "Find out the ongoing and upcoming events of NITK all in one place";
        Color buttonColor = Color(0xff0278ae);
        String imageLoc = "images/events.jpg";
        yield ChangeGuidePageState(
            text: text, buttonColor: buttonColor, imageLocation: imageLoc);
      } else if (event.index >= 3) {
        String text =
            "Get to know all about the delicious and healthy food provided by the mess in NITK.";
        String imageLoc = "images/mess.jpg";
        Color buttonColor = Color(0xff2a3d66);
        yield ChangeGuidePageState(
            text: text, buttonColor: buttonColor, imageLocation: imageLoc);
      }
    }else if (event is ChangeThemeEvent) {
      var theme;
      Color iColor, contColor;
      if (event.theme == lightTheme) {
        theme = darkTheme;
        iColor = Colors.white;
        contColor = Colors.black87;
      } else {
        theme = lightTheme;
        iColor = Colors.black87;
        contColor = Colors.white;
      }
      yield ChangeThemeState(
          theme: theme, indicatorColor: iColor, container: contColor);
    }
  }
}

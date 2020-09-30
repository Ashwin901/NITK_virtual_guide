import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wec_guide/constants.dart';
import 'package:wec_guide/wec_bloc/events.dart';
import 'package:wec_guide/components/exit.dart';
import 'package:wec_guide/wec_bloc/guide_bloc.dart';
import 'news_screen.dart';
import 'package:wec_guide/wec_bloc/state.dart';

class GuideScreen extends StatefulWidget {
  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int index;
  GuideBloc guideBloc;
  String description;
  Color buttonColor;
  String imageLocation;
  @override
  void initState() {
    // TODO: implement initState
    index = 1;
    description =
        "Get the latest news and information about NITK and web club.";
    buttonColor = Color(0xff056676);
    imageLocation = "images/news.png";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    guideBloc = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      body: BlocBuilder<GuideBloc, GuideState>(
        builder: (context, GuideState state) {
          if (state is ChangeGuidePageState) {
            description = state.text;
            buttonColor = state.buttonColor;
            imageLocation = state.imageLocation;
          }
          return WillPopScope(
            onWillPop: () {
              return onBackPressed(context);
            },
            child: SafeArea(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(right: 8, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text(
                          "skip",
                          style: textStyle.copyWith(
                            color: Colors.white
                          ),
                        ),
                        color: buttonColor,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MainScreen();
                          }));
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 140),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 150,
                        image: AssetImage(imageLocation),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 50, right: 30, top: 10, bottom: 10),
                        child: Text(description,
                            style: textStyle.copyWith(color:Colors.white,fontSize: 18)),
                      ),
                      FlatButton(
                        child: Text("next", style: textStyle.copyWith(color: Colors.white)),
                        color: buttonColor,
                        onPressed: () {
                          index++;
                          if (index <= 3) {
                            guideBloc.add(ChangeGuidePageEvent(index: index));
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MainScreen();
                            }));
                            index = 1;
                            guideBloc.add(ChangeGuidePageEvent(index: index));
                          }
                        },
                      )
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    guideBloc.close();
    super.dispose();
  }
}

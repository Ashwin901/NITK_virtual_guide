import 'package:flutter/material.dart';
import 'package:wec_guide/constants.dart';
import 'guide_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    height: 100,
                    image: AssetImage(
                      'images/webclub-logo-orange.png',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("WEC NITK", style: textStyle.copyWith(color:Colors.white,fontSize: 35)),
                  SizedBox(
                    height: 3,
                  ),
                  FlatButton(
                    child: Text("Get started",
                        style: textStyle.copyWith(color: Color(0xfff0a500))),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GuideScreen();
                      }));
                    },
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

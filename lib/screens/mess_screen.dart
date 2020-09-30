import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wec_guide/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wec_guide/components/menu_item.dart';

class MessScreen extends StatefulWidget {
  final title, subTitle, color;
  MessScreen({this.title, this.subTitle, this.color});
  @override
  _MessScreenState createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  var title, subTitle, sColor;
  List days;
  @override
  void initState() {
    // TODO: implement initState
    title = widget.title;
    subTitle = widget.subTitle;
    sColor = widget.color;
    days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(subTitle).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.black,
          ));
        }
        var menu = snapshot.data.docs;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    title,
                    style: textStyle,
                  ),
                  Text(
                    subTitle,
                    style: textStyle.copyWith(color: sColor, fontSize: 12),
                  )
                ],
              ),
            ),
            body: ListView.builder(
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return MenuItem(
                    day: days[index],
                    menuOfTheDay: menu[index].data()['menu'],
                  );
                }),
          ),
        );
      },
    );
  }
}

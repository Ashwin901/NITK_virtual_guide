import 'package:flutter/material.dart';
import 'package:wec_guide/constants.dart';

class MenuItem extends StatelessWidget {
  final day, menuOfTheDay;
  MenuItem({this.day, this.menuOfTheDay});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        expandedAlignment: Alignment.centerLeft,
        title: Text(
          day,
          style: textStyle.copyWith(fontSize: 25),
        ),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 13, bottom: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Breakfast : ${menuOfTheDay[0]}",
                  style: textStyle.copyWith(fontSize: 20),
                ),
                Text(
                  "Lunch : ${menuOfTheDay[1]}",
                  style: textStyle.copyWith(fontSize: 20),
                ),
                Text(
                  "Dinner : ${menuOfTheDay[2]}",
                  style: textStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:wec_guide/constants.dart';
import 'package:wec_guide/screens/mess_screen.dart';

Widget messWidget(){
  return Column(
    children: [
      Options(title: "Mess 1",subTitle: "vegetarian",sColor: Colors.green,),
      Options(title: "Mess 2",subTitle: "non-vegetarian",sColor: Colors.red,)
    ],
  );
}

class Options extends StatefulWidget {
  final title, subTitle, sColor;

  Options({this.title, this.subTitle, this.sColor});

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => MessScreen(title:widget.title, subTitle: widget.subTitle, color: widget.sColor,)
            ));
          },
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ Text(
                widget.title,
                style: textStyle,
              ),
                Text(widget.subTitle,
                  style: textStyle.copyWith(
                      color: widget.sColor
                  ),)
              ]
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
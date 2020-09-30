import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wec_guide/constants.dart';

void launchUrl(String tag) async {
  var url;
  if (tag == "event") {
    url = "https://www.nitk.ac.in/upcoming_events";
  } else if (tag == "news") {
    url = "https://www.nitk.ac.in/news";
  }
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

Widget itemList(var snaps, String tag) {
  return StreamBuilder<QuerySnapshot>(
    stream: snaps,
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.data == null) {
        return Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ));
      }
      var items = snapshot.data.docs;
      return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.launch),
                  onPressed: () {
                    launchUrl(tag);
                  },
                ),
                title: Text(
                  items[index].data()[tag],
                  style: textStyle.copyWith(fontSize: 18),
                ),
              ),
            );
          });
    },
  );
}

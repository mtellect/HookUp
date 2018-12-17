import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: new Text(
        "FEEDS TAB",
        style: TextStyle(fontSize: 20.0),
      )),
    );
  }
}

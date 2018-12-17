import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  int iamA = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: new AppBar(
        elevation: 0,
        title: Text("Profile Photo"),
        backgroundColor: Colors.pink,
      ),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Upload a picture of yourself",
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
          new Flexible(child: new Container()),
          new Container(
            height: 200,
            width: 200,
            child: new Icon(
              FontAwesomeIcons.user,
              size: 70,
              color: Colors.grey,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.pink[600], width: 5),
                shape: BoxShape.circle,
                color: Colors.white),
          ),
          new Flexible(child: new Container()),
          new RaisedButton(
            color: Colors.pink[800],
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            //highlightColor: Colors.white,
            //splashColor: Colors.white,
            onPressed: () => null,
            child: Center(
              child: Text(
                "CONTINUE",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

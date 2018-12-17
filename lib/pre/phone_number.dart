import 'package:flutter/material.dart';
import 'package:hookups/pre/profile_image.dart';

class WhoAmI extends StatefulWidget {
  @override
  _WhoAmIState createState() => _WhoAmIState();
}

class _WhoAmIState extends State<WhoAmI> {
  int iamA = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: new AppBar(
        elevation: 0,
        title: Text("Phone number"),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Enter",
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
          new Flexible(child: new Container()),
          new OutlineButton(
            color: iamA == 0 ? Colors.pink[800] : Colors.pink,
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            splashColor: Colors.pink[600],
            highlightedBorderColor: Colors.pink[600],
            borderSide: BorderSide(
                color: iamA == 0 ? Colors.white : Colors.white.withAlpha(120),
                width: iamA == 0 ? 2 : 1),
            onPressed: () {
              setState(() {
                iamA = 0;
              });
            },
            child: Center(
              child: Text(
                "WOMAN",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
          new SizedBox(
            height: 20.0,
          ),
          new OutlineButton(
            color: iamA == 1 ? Colors.pink[800] : Colors.pink,
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            splashColor: Colors.pink[600],
            highlightedBorderColor: Colors.pink[600],
            borderSide: BorderSide(
                color: iamA == 1 ? Colors.white : Colors.white.withAlpha(120),
                width: iamA == 1 ? 2 : 1),
            onPressed: () {
              setState(() {
                iamA = 1;
              });
            },
            child: Center(
              child: Text(
                "MAN",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
          new Flexible(child: new Container()),
          new RaisedButton(
            color: Colors.pink[800],
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            //highlightColor: Colors.white,
            //splashColor: Colors.white,
            onPressed: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) => ProfileImage())),
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

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hookups/pre/who_are_you.dart';
import 'package:hookups/utils/colors.dart';
import 'package:hookups/utils/images.dart';
import 'package:hookups/utils/index_data.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  Timer pageTimer;
  Timer colorTimer;
  int currentPage = 0;
  int currentColor = 0;
  bool reverse = false;
  PageController controller = new PageController();

  List<Color> containerColors = [
    //Colors.blue[600],
    Colors.pink[600],
    Colors.red[600],
    Colors.purple[600],
    Colors.indigo[600],
    Colors.orange[600],
    //Colors.yellow[600],
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageColorTimer();
    pageChangeTimer();
  }

  @override
  void dispose() {
    pageTimer.cancel();
    controller.dispose();
    super.dispose();
  }

  pageColorTimer() async {
    pageTimer = Timer.periodic(Duration(seconds: 5), (_) {
      if (reverse == false && currentPage < 3) {
        controller.nextPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeIn);
      } else if (reverse == true && currentPage <= 3) {
        controller.previousPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeOut);
      }
    });
  }

  pageChangeTimer() async {
    colorTimer = Timer.periodic(Duration(seconds: 5), (_) {
      int randColor = new Random().nextInt(containerColors.length - 1);
      setState(() {
        currentColor = randColor;
      });
    });
  }

  void onPageChanged(int value) {
    //print("$value $reverse");
    setState(() {
      currentPage = value;
    });

    if (currentPage == 3) {
      setState(() {
        reverse = true;
      });
      return;
    }

    if (currentPage == 0) {
      setState(() {
        reverse = false;
      });
      return;
    }
  }

  Future<bool> onBackPressed() async {
    Navigator.pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            colorfulContainer(),
            bodyUI(),
          ],
        ),
      ),
    );
  }

  Widget colorfulContainer() {
    return AnimatedContainer(
      color: containerColors[currentColor],
      duration: Duration(seconds: 3),
      curve: Curves.bounceInOut,
    );
  }

  Widget imageChanger() {
    return Container(
      //color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.65,
      child: PageIndicatorContainer(
          size: 10.0,
          indicatorSpace: 10.0,
          indicatorSelectorColor: Colors.white,
          indicatorColor: Colors.white.withAlpha(100),
          align: IndicatorAlign.bottom,
          padding: EdgeInsets.only(top: 30.0),
          pageView: new PageView.builder(
              controller: controller,
              onPageChanged: onPageChanged,
              itemCount: index_data.length,
              itemBuilder: (c, index) {
                return Stack(
                  children: <Widget>[
                    new Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 50.0, right: 50.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withAlpha(50),
                                spreadRadius: 5.0,
                                blurRadius: 5.0)
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(250, 100),
                            bottomRight: Radius.elliptical(250, 100),
                          ),
                          image: DecorationImage(
                              image: AssetImage(index_data[index].assetLink),
                              fit: BoxFit.cover)),
                    ),
                    new Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 50.0, right: 50.0),
                      decoration: BoxDecoration(
                        //color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black.withAlpha(80),
                              spreadRadius: 5.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(250, 100),
                          bottomRight: Radius.elliptical(250, 100),
                        ),
                      ),
                    ),
                    new Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(top: 20.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            index_data[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            index_data[index].subTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white.withAlpha(180)),
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(250, 100),
                            bottomRight: Radius.elliptical(250, 100),
                          )),
                    ),
                  ],
                );
              }),
          length: 4),
    );
  }

  Widget bottomUi() {
    return Container(
      //height: 200.0,
      padding: EdgeInsets.only(left: 30, right: 30, top: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Flexible(
              child: new Container(
            height: MediaQuery.of(context).size.height * 0.65,
          )),
          new RaisedButton(
            onPressed: () => Navigator.push(
                context, new MaterialPageRoute(builder: (context) => WhoAmI())),
            color: Colors.blue[700],
            child: Container(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                    size: 15.0,
                  ),
                  new SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Sign in with Facebook",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
          ),
          SizedBox(
            height: 15.0,
          ),
          new RaisedButton(
            onPressed: () => Navigator.push(
                context, new MaterialPageRoute(builder: (context) => WhoAmI())),
            color: Colors.white,
            child: Container(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.google,
                    color: Colors.green,
                    size: 15.0,
                  ),
                  new SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Sign in with Google",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
          ),
          new SizedBox(
            height: 15.0,
          ),
          new Text(
            "By continuing,you agree to the following "
                "Terms of Service & Privacy Policy",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget hookUpIcon() {
    return new Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: new Image.asset(
            hookUp,
            width: 200.0,
            height: 200.0,
            //color: Colors.white,
          ),
        ));
  }

  Widget bodyUI() {
    return Stack(
      children: <Widget>[imageChanger(), bottomUi(), hookUpIcon()],
    );
  }
}

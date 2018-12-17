import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hookups/scr/round_icon_button.dart';
import 'package:hookups/utils/images.dart';
import 'package:page_indicator/page_indicator.dart';

class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab>
    with AutomaticKeepAliveClientMixin<SettingsTab> {
  int currentPage = 0;
  int currentColor = 0;
  bool reverse = false;
  PageController _controller = new PageController();
  Timer _pageChangeTimer;
  Timer colorTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageChanger();
  }

  @override
  void dispose() {
    _pageChangeTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _pageChanger() {
    _pageChangeTimer = Timer.periodic(Duration(seconds: 2), (_) {
      if (reverse == false && currentPage < hookUpPlusList.length - 1) {
        _controller.nextPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeIn);
      } else if (reverse == true && currentPage <= hookUpPlusList.length - 1) {
        _controller.previousPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeOut);
      }
    });
  }

  void _onPageChanged(int value) {
    //print("$value $reverse");
    setState(() {
      currentPage = value;
    });

    if (currentPage == hookUpPlusList.length - 1) {
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      body: new Stack(
        children: <Widget>[_buildProfileInfo(), _buildSettingsBottom()],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.only(
          right: 15.0, left: 15.0, top: 20.0, bottom: 50.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1.0,
                blurRadius: 1.0)
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(250, 100),
            bottomRight: Radius.elliptical(250, 100),
          )),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(avatar),
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2)),
          ),
          new SizedBox(
            height: 10.0,
          ),
          new Text(
            "Stessi, 21",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          new SizedBox(
            height: 10.0,
          ),
          new Text(
            "Columbia University in the City of New York",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          new SizedBox(
            height: 20.0,
          ),
          _buildSettingsButtons()
        ],
      ),
    );
  }

  Widget _buildSettingsBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Flexible(child: _buildHookUpPlusUI()),
          new Padding(
            padding:
                const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 25.0),
            child: new RaisedButton(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              onPressed: () {},
              child: Center(
                child: new Text(
                  "MY HOOKUP PLUS",
                  style: TextStyle(color: Colors.pink, fontSize: 16.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHookUpPlusUI() {
    return Container(
      height: 150.0,
      child: PageIndicatorContainer(
          size: 8.0,
          indicatorSpace: 5.0,
          indicatorSelectorColor: Colors.blue,
          indicatorColor: Colors.grey.withOpacity(0.5),
          align: IndicatorAlign.bottom,
          pageView: new PageView.builder(
              controller: _controller,
              onPageChanged: _onPageChanged,
              itemCount: hookUpPlusList.length,
              itemBuilder: (c, index) {
                return new Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.only(top: 20.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        hookUpPlusList[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        hookUpPlusList[index].subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                );
              }),
          length: hookUpPlusList.length),
    );
  }

  Widget _buildSettingsButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.settings,
              iconColor: Colors.red,
              onPressed: () {
                //TODO
              },
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "SETTINGS",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RoundIconButton.small(
              icon: Icons.camera_alt,
              iconColor: Colors.blue,
              onPressed: () {
                //TODO
              },
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "ADD MEDIA",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        new Column(
          children: <Widget>[
            new RoundIconButton.large(
              icon: Icons.edit,
              iconColor: Colors.green,
              onPressed: () {
                //TODO
              },
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Text(
              "EDIT INFO",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class HookUpPlus {
  final String title;
  final String subTitle;
  HookUpPlus({this.title, this.subTitle});
}

final List<HookUpPlus> hookUpPlusList = [
  new HookUpPlus(
      title: "Get HookUp Gold", subTitle: "See who Likes You and more!"),
  new HookUpPlus(title: "Get Matches Faster", subTitle: ""),
  new HookUpPlus(
      title: "StandOut With Super Likes",
      subTitle: "You're 3X more likely to get match!"),
  new HookUpPlus(
      title: "Swipe Around The World",
      subTitle: "Passport to anywhere with HookUp Plus"),
  new HookUpPlus(
      title: "Control Your Profile",
      subTitle: "Limit what others see with HookUp Plus"),
  new HookUpPlus(
      title: "I Mean't to Swipe Right",
      subTitle: "Get unlimited Rewinds with HookUp Plus!"),
  new HookUpPlus(
      title: "Increase Your Chances",
      subTitle: "Get unlimited Likes with HookUp Plus!"),
];

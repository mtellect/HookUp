import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hookups/scr/hookup.dart';
import 'package:hookups/tabs/messages_tab/messages_index.dart';
import 'package:hookups/tabs/settings_tab/settings_tab.dart';
import 'package:hookups/utils/images.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  PageController _pageController = new PageController(initialPage: 1);
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildHookUpAppBar(),
      body: _buildTabsLayout(),
    );
  }

  Widget _buildTabsLayout() {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: _onPageChange,
      children: <Widget>[
        new SettingsTab(),
        new HookUp(),
        new MessagesTab(),
      ],
    );
  }

  Widget _buildHookUpAppBar() {
    return new PreferredSize(
        child: new SafeArea(
          child: new Container(
            //margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _buildTabItem(
                    position: 0,
                    widget: new AnimatedContainer(
                        child: Icon(
                          FontAwesomeIcons.solidUserCircle,
                          size: 30.0,
                          color: currentPage == 0 ? Colors.pink : Colors.grey,
                        ),
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastOutSlowIn)),
                _buildTabItem(
                    position: 1,
                    widget: new Image.asset(
                      hookup_icon_small,
                      color: currentPage == 1 ? null : Colors.grey,
                      height: 60.0,
                      width: 60.0,
                    )),
                _buildTabItem(
                    position: 2,
                    widget: Image.asset(
                      ic_chat,
                      color: currentPage == 2 ? Colors.pink : Colors.grey,
                      height: 30.0,
                      width: 30.0,
                    )),
              ],
            ),
          ),
        ),
        preferredSize: new Size.fromHeight(60.0));
  }

  Widget _buildTabItem({Widget widget, int position}) {
    return new GestureDetector(
      onTap: () {
        _pageController.jumpToPage(position);
      },
      child: Center(
        child: widget,
      ),
    );
  }

  void _onPageChange(int value) {
    setState(() {
      currentPage = value;
    });
  }
}

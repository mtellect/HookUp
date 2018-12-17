import 'package:flutter/material.dart';
import 'package:hookups/tabs/messages_tab/feed.dart';
import 'package:hookups/tabs/messages_tab/messages.dart';

class MessagesTab extends StatefulWidget {
  @override
  _MessagesTabState createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab>
    with AutomaticKeepAliveClientMixin<MessagesTab> {
  PageController _pageController = new PageController(initialPage: 0);
  int currentPage = 0;

  Widget _buildMessageAppBar() {
    return new Column(
      children: <Widget>[
        new Divider(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildTabItem(title: "Messages", position: 0),
            new Container(
              height: 30.0,
              width: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            _buildTabItem(title: "Feed", position: 1),
          ],
        ),
        new Divider()
      ],
    );
  }

  Widget _buildTabsLayout() {
    return new Flexible(
      child: PageView(
        controller: _pageController,
        //physics: NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChange,
        children: <Widget>[
          new Messages(),
          new Feed(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        children: <Widget>[_buildMessageAppBar(), _buildTabsLayout()],
      ),
    );
  }

  void _onPageChange(int value) {
    setState(() {
      currentPage = value;
    });
  }

  Widget _buildTabItem({String title, int position}) {
    Color color = position == currentPage ? Colors.pink : Colors.grey;

    return new Flexible(
        child: new GestureDetector(
            onTap: () {
              _pageController.jumpToPage(position);
            },
            child: Center(
                child: new Text(
              title,
              style: TextStyle(
                  color: color, fontSize: 16.0, fontWeight: FontWeight.bold),
            ))));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

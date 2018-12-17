import 'package:flutter/material.dart';
import 'package:hookups/utils/images.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        new SliverList(
            delegate: SliverChildListDelegate([
          _buildSearchField(),
          _buildMatches(),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: new Text(
              "Messages",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.pink),
            ),
          ),
          new SizedBox(
            height: 10.0,
          ),
        ])),
      ],
    );
  }

  Widget _buildEntireBody() {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildSearchField(),
          _buildMatches(),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: new Text(
              "Messages",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.pink),
            ),
          ),
          new SizedBox(
            height: 10.0,
          ),
          _buildMessages()
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: new TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Colors.pink,
          ),
          hintText: "Search 2 Matches",
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18.0),
          border: new UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.pink.withOpacity(0.5), width: 0.5)),
          enabledBorder: new UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.pink.withOpacity(0.5), width: 0.5)),
          disabledBorder: new UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.pink.withOpacity(0.5), width: 0.5)),
          focusedBorder: new UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.pink.withOpacity(0.5), width: 0.5)),
        ),
      ),
    );
  }

  Widget _buildMatches() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            "New Matches",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.pink),
          ),
          new SizedBox(
            height: 10.0,
          ),
          _buildMatchList()
        ],
      ),
    );
  }

  Widget _buildMatchList() {
    return new Container(
        height: 100.0,
        child: new ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return new Container(
                margin: EdgeInsets.all(5.0),
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(avatar),
                        fit: BoxFit.cover,
                        alignment: Alignment.center),
                    shape: BoxShape.circle,
                    color: Colors.pink.withOpacity(0.2)),
              );
            }));
  }

  Widget _buildMessages() {
    return new ListView.separated(
      itemCount: 4,
      itemBuilder: (context, index) {
        return new ListTile(
          leading: new Container(
            margin: EdgeInsets.all(5.0),
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(avatar),
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
                shape: BoxShape.circle,
                color: Colors.pink.withOpacity(0.2)),
          ),
          title: new Text(
            "Emmanuella",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: new Text(
            "so what are you studying?",
            style: TextStyle(),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: new Divider(
            height: 24.0,
          ),
        );
      },
    );
  }
}

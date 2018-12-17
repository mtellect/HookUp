import 'package:flutter/material.dart';
import 'package:hookups/scr/draggable_card.dart';
import 'package:hookups/scr/matches.dart';
import 'package:hookups/scr/photo_browser.dart';
import 'package:hookups/scr/profiles.dart';
import 'package:hookups/utils/images.dart';

class ProfileCard extends StatefulWidget {
  final Profile profile;
  final Decision decision;
  final SlideRegion region;
  final bool isDraggable;
  const ProfileCard({
    Key key,
    this.profile,
    this.decision,
    this.region,
    this.isDraggable = true,
  }) : super(key: key);
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  Widget _buildPhotos() {
    return new PhotoBrowser(
        photoAssetPaths: widget.profile.photos, visiblePhotoIndex: 0);
  }

  Widget _buildProfileSynopsis() {
    return new Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: new Container(
        decoration: new BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withAlpha(180)])),
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  "${widget.profile.name.split(" ")[0]}, ${widget.profile.age}",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                new Text(
                  widget.profile.bio,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                new Text(
                  widget.profile.location,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
            new Icon(
              Icons.info,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10.0), boxShadow: [
        new BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 5.0,
            spreadRadius: 2.0)
      ]),
      child: new ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: new Material(
          child: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildPhotos(),
              _buildProfileSynopsis(),
              widget.isDraggable == false
                  ? new Container(
                      color: Colors.transparent,
                    )
                  : _buildRegionIndicator(),
              widget.isDraggable == false
                  ? new Container(
                      color: Colors.transparent,
                    )
                  : _buildDecisionIndicator()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegionIndicator() {
    switch (widget.region) {
      case SlideRegion.inNopeRegion:
        return _nopeIndicator();
        break;
      case SlideRegion.inLikeRegion:
        return _likeIndicator();
        break;
      case SlideRegion.inSuperLikeRegion:
        return _superLikeIndicator();
        break;
      default:
        return new Container(
          color: Colors.transparent,
        );
    }
  }

  Widget _buildDecisionIndicator() {
    switch (widget.decision) {
      case Decision.nope:
        return _nopeIndicator();
        break;
      case Decision.like:
        return _likeIndicator();
        break;
      case Decision.superLike:
        return _superLikeIndicator();
        break;
      default:
        return new Container(
          color: Colors.transparent,
        );
    }
  }

  Widget _nopeIndicator() {
    return new Align(
      alignment: Alignment.topRight,
      child: new Transform.rotate(
        angle: 270.0,
        origin: Offset(0.0, 0.0),
        child: new Container(
          height: 80.0,
          width: 150.0,
          margin: const EdgeInsets.all(16.0),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.red, width: 5.0)),
          child: Center(
              child: new Text(
            "NOPE",
            style: TextStyle(
                color: Colors.red, fontSize: 40.0, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  Widget _likeIndicator() {
    return new Align(
      alignment: Alignment.topLeft,
      child: new Transform.rotate(
        angle: 270.0,
        origin: Offset(0.0, 0.0),
        child: new Container(
          height: 80.0,
          width: 150.0,
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 5.0)),
          child: Center(
              child: new Text(
            "LIKE",
            style: TextStyle(
                color: Colors.green,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  Widget _superLikeIndicator() {
    return new Align(
      alignment: Alignment.bottomCenter,
      child: new Container(
        height: 150.0,
        width: 150.0,
        margin: const EdgeInsets.only(bottom: 100.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.blue, width: 5.0)),
        child: Center(
            child: new Text(
          "SUPER LIKE",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue, fontSize: 40.0, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

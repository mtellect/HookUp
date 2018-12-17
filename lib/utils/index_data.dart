import 'package:flutter/material.dart';
import 'package:hookups/utils/images.dart';

class IndexData {
  String assetLink;
  String title;
  String subTitle;
  Color color;

  IndexData({this.assetLink, this.title, this.subTitle, this.color});
}

List<IndexData> index_data = [
  IndexData(
      assetLink: img2,
      title: "Life is too short",
      subTitle: "Not to get laid",
      color: Colors.lightBlue[600]),
  IndexData(
      assetLink: img1,
      title: "Make new discoveries",
      subTitle: "Find interesting people around you",
      color: Colors.blue[600]),
  IndexData(
      assetLink: swipe,
      title: "Get Laid",
      subTitle: "Swipe Right to get laid,\n or Swipe Left to pass",
      color: Colors.green[600]),
  IndexData(
      assetLink: match,
      title: "It's a Match!",
      subTitle: "if they also Swipe Right, it's a match!",
      color: Colors.brown[600])
];

import 'package:flutter/material.dart';

class SelectedPhotoIndicator extends StatelessWidget {
  final int photoCount;
  final int visiblePhotoIndex;

  const SelectedPhotoIndicator(
      {Key key, this.photoCount, this.visiblePhotoIndex})
      : super(key: key);

  Widget _buildInActiveIndicator() {
    return new Expanded(
        child: new Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: Container(
        height: 3.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5),
            color: Colors.black.withAlpha(50)),
      ),
    ));
  }

  Widget _buildActiveIndicator() {
    return new Expanded(
        child: new Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: Container(
        height: 3.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5),
            color: Colors.white,
            boxShadow: [
              new BoxShadow(
                  color: Colors.black.withAlpha(120),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0.0, 1.0))
            ]),
      ),
    ));
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < photoCount; i++) {
      indicators.add(i == visiblePhotoIndex
          ? _buildActiveIndicator()
          : _buildInActiveIndicator());
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        children: _buildIndicators(),
      ),
    );
  }
}

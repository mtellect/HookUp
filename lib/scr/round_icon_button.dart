import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;
  final String imageAsset;

  RoundIconButton.large(
      {this.icon,
      this.iconColor,
      this.size = 60.0,
      this.onPressed,
      this.imageAsset});

  RoundIconButton.small(
      {this.icon,
      this.iconColor,
      this.size = 50.0,
      this.onPressed,
      this.imageAsset});

  RoundIconButton.widget(
      {this.icon,
      this.iconColor,
      this.size = 50.0,
      this.onPressed,
      this.imageAsset});

  RoundIconButton(
      {this.icon, this.iconColor, this.size, this.onPressed, this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 10.0,
                spreadRadius: 1)
          ]),
      child: imageAsset == null
          ? new RawMaterialButton(
              shape: new CircleBorder(),
              elevation: 0.0,
              child: Icon(
                icon,
                color: iconColor,
              ),
              onPressed: onPressed,
            )
          : new RawMaterialButton(
              shape: new CircleBorder(),
              elevation: 0.0,
              child: Image.asset(
                imageAsset,
                height: size - 15,
                width: size - 15,
                color: iconColor,
              ),
              onPressed: onPressed,
            ),
    );
  }
}

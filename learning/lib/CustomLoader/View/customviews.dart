import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double marginLeft;
  final double marginRight;
  final double size;

  const Circle(
      {Key? key,
      required this.marginLeft,
      required this.marginRight,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: this.size,
      height: this.size,
      margin: new EdgeInsets.only(left: marginLeft, right: marginRight),
      decoration: new BoxDecoration(
        color: Colors.yellow,
        borderRadius: new BorderRadius.circular(this.size * 0.45),
      ),
    );
  }
}

class ScaleCircle extends AnimatedWidget {
  final Animation<double> controller;
  final Animation<double> animation;
  final double marginLeft;
  final double size;
  final double marginRight;

  ScaleCircle({
    Key? key,
    required this.controller,
    required this.animation,
    required this.size,
    this.marginLeft = 2.0,
    this.marginRight = 2.0,
  }) : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      alignment: Alignment.center,
      child: new Circle(
          marginRight: this.marginRight,
          marginLeft: this.marginLeft,
          size: this.size),
    );
  }
}

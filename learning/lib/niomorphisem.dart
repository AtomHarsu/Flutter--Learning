import 'package:flutter/material.dart';

Center newMethod1() {
  bool isPressed = false;
  void buttonTap() {}
  return Center(
    child: GestureDetector(
      onTap: buttonTap,
      child: isPressed
          ? Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[500]!,
                      offset: Offset(4, 4),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15.0,
                      spreadRadius: 1.0)
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.android_outlined,
                  size: 100,
                ),
              ))
          : Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[500]!,
                      offset: Offset(4, 4),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15.0,
                      spreadRadius: 1.0)
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.apple,
                  size: 100,
                ),
              ),
            ),
    ),
  );
}

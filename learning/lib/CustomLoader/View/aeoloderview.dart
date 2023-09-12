// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'customviews.dart';

// ignore: must_be_immutable
class AeoLoaderView extends StatefulWidget {
  String loaderTitle;
  double loaderWidth;
  double loaderHeight;
  int animationTimeMS;
  double animationSpeed;
  int uicount;

  AeoLoaderView(
      {Key? key,
      required this.loaderTitle,
      this.loaderWidth = 200.0,
      this.loaderHeight = 200.0,
      this.animationTimeMS = 5000,
      this.animationSpeed = 0.15,
      this.uicount = 4});

  @override
  _AeoLoaderState createState() => _AeoLoaderState(
      loaderWidth: loaderWidth,
      loaderHeight: loaderHeight,
      loaderTitle: loaderTitle,
      animationSpeed: animationSpeed,
      animationTimeMS: animationTimeMS,
      uicount: uicount);
}

class _AeoLoaderState extends State<AeoLoaderView>
    with TickerProviderStateMixin {
  String loaderTitle;
  double loaderWidth;
  double loaderHeight;
  int animationTimeMS;
  double animationSpeed;
  int uicount;

  _AeoLoaderState(
      {Key? key,
      required this.loaderTitle,
      this.loaderWidth = 100.0,
      this.loaderHeight = 100.0,
      this.animationTimeMS = 5000,
      this.animationSpeed = 0.15,
      this.uicount = 4});

  List<Widget> createWidigetForAnimation() {
    // ARRAY TO HOLD ALL ANIMATED WIDGETS
    List<Widget> widgets = [];
    // ANIMATION DRIVING VALUES
    final double as = animationSpeed;
    double initialSpeed = 0.0;

    // ANIMATION CLASSES
    Tween<double> t = Tween<double>(begin: 0.0, end: 1.00);
    AnimationController _controller = AnimationController(
      duration: Duration(milliseconds: animationTimeMS),
      vsync: this,
    );
    _controller.repeat().orCancel;

    for (var i = 0; i < 4; i++) {
      widgets.add(ScaleCircle(
          controller: _controller,
          animation: t.animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(
                initialSpeed,
                initialSpeed + as,
                curve: Curves.linear,
              ),
            ),
          ),
          size: 25.0));
      initialSpeed += as;
    }
    return widgets;
  }

 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: loaderWidth,
      height: loaderHeight,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: createWidigetForAnimation(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                loaderTitle,
                style: GoogleFonts.lato(
                  color: Colors.yellow,
                  fontSize: 16.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

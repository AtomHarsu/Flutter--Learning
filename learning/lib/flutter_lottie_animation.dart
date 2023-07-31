import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LotiANimationDart extends StatefulWidget {
  const LotiANimationDart({super.key});

  @override
  State<LotiANimationDart> createState() => _LotiANimationDartState();
}

class _LotiANimationDartState extends State<LotiANimationDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('asstes/animation_lki57hub.json'),
          Text('Coming soon',
              style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          /* Lottie.asset('asstes/animation_lki52517.json'), */
        ],
      ),
    );
  }
}

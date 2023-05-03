import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

SafeArea newMethod3(BuildContext context) {
  return SafeArea(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 250,
          child: Lottie.network(
              'https://assets9.lottiefiles.com/private_files/lf30_m6j5igxb.json'),
        ),
        Text(
          'Hello Again',
          style: GoogleFonts.bebasNeue(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Welcome back ,You have been missed',
          style: GoogleFonts.bebasNeue(
            fontSize: 18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.purple,
                ),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              labelText: "Email*",
              labelStyle: TextStyle(color: Colors.purple),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: TextFormField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.purple,
                ),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              labelText: "Password*",
              labelStyle: TextStyle(color: Colors.purple),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              )),
        )
      ],
    ),
  );
}

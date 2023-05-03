import 'package:flutter/material.dart';

import 'otpverification.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      behavior: SnackBarBehavior.floating,
                      content: CustomSnackBar(
                          icon: Icons.check_circle_outline,
                          colors: Colors.green,
                          text: 'Welcome to The Flutter Community',
                          title: 'Hello!Flutter Dev'),
                    ),
                  );
                },
                child: const Text('Snackbar Success')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      behavior: SnackBarBehavior.floating,
                      content: CustomSnackBar(
                          icon: Icons.close,
                          colors: Colors.red,
                          text: 'Welcome to The Flutter Community',
                          title: 'Hello!Flutter Dev'),
                    ),
                  );
                },
                child: const Text('Snackbar Error')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      behavior: SnackBarBehavior.floating,
                      content: CustomSnackBar(
                          icon: Icons.report,
                          colors: Colors.orange,
                          text: 'Welcome to The Flutter Community',
                          title: 'Hello!Flutter Dev'),
                    ),
                  );
                },
                child: const Text('Snackbar Alert')),
          ],
        ),
      ),
    );
  }
}

class CustomSnackBar extends StatelessWidget {
  String? title;
  String? text;
  Color? colors;
  IconData icon;

  CustomSnackBar(
      {super.key,
      required this.text,
      required this.title,
      required this.icon,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 70,
          decoration: BoxDecoration(
            color: colors,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: const TextStyle(
                          fontSize: 15, color: Colors.white, letterSpacing: 1),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const Spacer(),
                    Text(
                      text!,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.white, letterSpacing: 1),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 2,
          bottom: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.cyan[300],
                ),
                child: const Center(
                    child: Text(
                  'Flutter',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  const Text(
                    'Revolution in Tecnology',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: Container(
              height: 250,
              width: 250,
              child: Image.network(
                  'https://avatars.githubusercontent.com/u/38634459?v=4?s=100'),
            )),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                ' Start Your\n Flutter Journy Now ',
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 40),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(95)),
                  color: Colors.cyan[300],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(),
                        keyboardType: TextInputType.number,
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
                            borderSide: BorderSide(
                              color: Colors.cyan[300]!,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.orange[300],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginMobileAuth(),
                                    ));
                              },
                              child: const Text(
                                'Get OTP',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

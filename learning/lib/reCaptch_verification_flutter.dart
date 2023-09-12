import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';

/* const String recaptchaSiteKey = '6LcO5WwnAAAAAEFs4Q6AQ9ZArVWdd4DyYG246xp_'; */
/* const String backendUrl = '6LcO5WwnAAAAAP8TiHHv8wJ4uIjnnGkn5DtDJ0wE'; */

class MyAppData extends StatefulWidget {
  const MyAppData({Key? key}) : super(key: key);

  @override
  State<MyAppData> createState() => _MyAppDataState();
}

class _MyAppDataState extends State<MyAppData> {
  String _token = 'Click the below button to generate token';
  bool badgeVisible = true;
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> getToken() async {
    String token = await GRecaptchaV3.execute('submit') ?? 'null returned';
    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Recaptcha V3 Web example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText('Token: $_token\n'),
              ElevatedButton(
                onPressed: getToken,
                child: const Text('Get new token'),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  if (badgeVisible) {
                    GRecaptchaV3.hideBadge();
                  } else {
                    GRecaptchaV3.showBadge();
                  }
                  badgeVisible = !badgeVisible;
                },
                icon: const Icon(Icons.legend_toggle),
                label: const Text("Toggle Badge Visibilty"),
              ),
              TextButton.icon(
                  label: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(
                        text: "https://pub.dev/packages/g_recaptcha_v3"));
                  },
                  icon: const SelectableText(
                      "https://pub.dev/packages/g_recaptcha_v3")),
            ],
          ),
        ),
      ),
    );
  }
}

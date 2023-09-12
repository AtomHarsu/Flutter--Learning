import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:learning/CustomLoader/Controller/SplashScreen.dart';
import 'package:learning/CustomLoader/Controller/hompage.dart';
import 'package:learning/creat/file_provider.dart';
import 'package:provider/provider.dart';
import 'dr/data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    bool ready = await GRecaptchaV3.ready(
        "6Lfl7coUAAAAAKUjryaKQDhrrklXE9yrvWNXqKTj",
        showBadge: true); //--2
    // ignore: avoid_print
    print("Is Recaptcha ready? $ready");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FileProvider>(
          create: (context) => FileProvider(),
        ),
        ChangeNotifierProvider<DataProvider>(
          create: (context) => DataProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/HomePage': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learning/creat/file_provider.dart';
import 'package:provider/provider.dart';
import 'custompassword_genrate_flutter.dart';
import 'dr/data_provider.dart';

void main() {
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
        home: GeneratePassword(),
      ),
    );
  }
}

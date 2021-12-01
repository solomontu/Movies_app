import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:movies/ui/Home/home_page.dart';

import 'business_logic/models.dart/services/service_locator.dart';

void main()async {
  SystemChrome.setSystemUIOverlayStyle(
   const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  setupServiceLocators();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Movie',
      theme: ThemeData(
       backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Color(0xFF1f1f25)),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Book Movie'),
    );
  }
}

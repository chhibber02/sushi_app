import 'package:flutter/material.dart';
import 'package:sushi_app/pages/home_page.dart';
import 'package:sushi_app/pages/intro_page.dart';

import 'pages/menu_page.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const IntroPage(),
      routes: {
        'home':(context) => const HomePage(),
        'menuPage':(context) => const MenuPage(),
      },
    );
  }

}
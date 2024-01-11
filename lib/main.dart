import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/pages/cart_page.dart';
import 'package:sushi_app/pages/intro_page.dart';

import 'pages/menu_page.dart';

void main() {
  return runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
        'menuPage': (context) => const MenuPage(),
        'cartPage': (context) => const CartPage(),
      },
    );
  }
}

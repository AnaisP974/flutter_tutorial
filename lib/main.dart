import 'package:flutter/material.dart';
import 'package:tuto2/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // LES ROUTES NOMMEES
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
      },
    );
  }
}

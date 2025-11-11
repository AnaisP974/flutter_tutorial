import 'package:flutter/material.dart';
import 'package:tuto2/pages/setting_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home Page"))),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Faire une redirection
            Navigator.pushNamed(
              context,
              '/settings'
            );
          },
          child: const Text("Setting page"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  // Entry point of the application
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Tutorial'), 
        ),
        elevation: 12.0,
      ),
      body: Center(
        child: Text('Welcome to the Home Page! ($counter likes)'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

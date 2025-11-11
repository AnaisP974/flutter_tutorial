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
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(30.0),
            padding: const EdgeInsets.all(20.0),
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.amber,
            ),
            child: Text('Welcome to the Home Page!'),
          ),
          Container(padding: const EdgeInsets.only(right: 50.0), alignment: Alignment.centerRight, child: Text('$counter likes', textAlign: TextAlign.end, style: TextStyle(fontStyle: FontStyle.italic),)),
         
        ],
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

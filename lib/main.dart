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
      body: SingleChildScrollView(
        child: Column(
          spacing: 40,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Text 1'),
                Text('Text 2'),
                Text('Text 3'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('RIHANNA', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                Text("Icône mondiale de la pop et de J'adore de Dior", style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.thumb_down, color: const Color.fromARGB(255, 188, 32, 21), size: 30.0),
                    Image.network("data:image/jpeg;base64,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"),
                    Icon(Icons.thumb_up, color: const Color.fromARGB(255, 29, 169, 11), size: 30.0),
                  ],
                ),
                Text("Chanteuse", style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic)),
              ],
            ),
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
            Container(padding: const EdgeInsets.only(left: 50.0), alignment: Alignment.centerLeft, child: Text('$counter likes', textAlign: TextAlign.end, style: TextStyle(fontStyle: FontStyle.italic),)),
          
          ],
        ),
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

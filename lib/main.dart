import 'package:flutter/material.dart';

void main() {
  // Entry point of the application
  runApp(
    MaterialApp(
      // Personnalisation du theme de la page
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      // Retrait de la bannière "Debug"
      debugShowCheckedModeBanner: false,
      // Lancement de la HomePage
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Color bg = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(title: Center(child: Text("Les différents boutons"))),
      body: ListView(
        padding: const EdgeInsets.all(40),
        children: [
          OutlinedButton(
            onPressed: () {
              setState(() {
                bg = Colors.blue;
              });
            },
            style: OutlinedButton.styleFrom(backgroundColor: Colors.blueAccent),
            child: const Text("Blue"),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {
              setState(() {
                bg = const Color.fromARGB(148, 194, 33, 243);
              });
            },
            // Pour mettre du style sur le bouton
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 216, 46, 243),
            ),
            child: const Text("Pink"),
          ),
          const SizedBox(height: 15),
          IconButton(
            onPressed: () {
              setState(() {
                bg = const Color.fromARGB(147, 243, 236, 33);
              });
            },
            style: IconButton.styleFrom(backgroundColor: Colors.yellowAccent),
            icon: Icon(Icons.home),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              setState(() {
                bg = Colors.white;
              });
            },
            // Pour mettre du style sur le bouton
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(1),
              ),
              elevation: 12,
            ),
            child: Text("Réinitialiser"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            bg = const Color.fromARGB(146, 54, 243, 33);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

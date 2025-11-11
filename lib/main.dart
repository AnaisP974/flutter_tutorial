import 'package:flutter/material.dart';
import 'package:tuto2/pages/actus.dart';
import 'package:tuto2/pages/communautes.dart';
import 'package:tuto2/pages/appels.dart';
import 'package:tuto2/pages/discussions.dart';

void main() {
  // Entry point of the application
  runApp(
    MaterialApp(
      // Personnalisation du theme de la page
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
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
  // Stockage des pages dans l'ordre d'affichage
  final pages = [
    DiscussionsPage(),
    ActusPage(),
    CommunautesPage(),
    AppelsPage(),
  ];

  // Initialisation de la variable pageIndex à 0
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // **** Barre de Navigation ****
      appBar: AppBar(
        title: Center(child: const Text('WHATSAPP')),
        elevation: 12.0, // permet l'ajout d'un filtre
      ),

      // **** Body **** 
      // on affiche la page en fonction de pageIndex (initialisé à 0)
      body: pages[pageIndex],

      //  **** Footer **** 
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.2)
          )
        ),
        child: NavigationBar(
          selectedIndex: pageIndex, // Permet de rendre le bouton actif selon pageIndex
          onDestinationSelected: (int index) {
            // mettre à jour le pageIndex
            setState(() { 
              pageIndex = index;
            });
          },
          backgroundColor: Colors.white,
          // Les différents boutons
          destinations: [
            NavigationDestination(icon: Icon(Icons.message), label: "Discussion"),
            NavigationDestination(icon: Icon(Icons.filter_tilt_shift), label: "Actus"),
            NavigationDestination(icon: Icon(Icons.group), label: "Communautés"),
            NavigationDestination(icon: Icon(Icons.phone), label: "Appels"),
          ],
        ),
      ),
    );
  }
}

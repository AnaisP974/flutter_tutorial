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
  List<String> perfumeBrands = [
    "Chanel",
    "Dior",
    "Gucci",
    "Versace",
    "Yves Saint Laurent",
    "Tom Ford",
    "Hermès",
    "Guerlain",
    "Lancôme",
    "Calvin Klein",
    "Armani",
    "Givenchy",
    "Prada",
    "Burberry",
    "Montblanc",
    "Hugo Boss",
    "Dolce & Gabbana",
    "Jimmy Choo",
    "Jo Malone London",
    "Creed",
    "Maison Francis Kurkdjian",
    "Byredo",
    "Acqua di Parma",
    "Issey Miyake",
    "Elie Saab",
    "Salvatore Ferragamo",
    "Armaf",
    "Lattafa",
    "Roberto Cavalli",
    "Valentino",
    "Ariana Grande Fragrances",
    "Versace Dylan Blue (brand instead maybe Versace)",
    "Kenzo",
    "Mugler",
    "Nina Ricci",
    "Cacharel",
    "Bvlgari",
    "Paco Rabanne",
    "Carolina Herrera",
    "Coach",
    "Tommy Hilfiger",
    "Jean Paul Gaultier"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('ListView() Widget')),
        elevation: 12.0,
      ),
      body: ListView.separated(
        itemCount: perfumeBrands.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(perfumeBrands[index]),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      )
    );
  }
}

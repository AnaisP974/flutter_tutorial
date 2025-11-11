import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final dio = Dio(); // => Pour pouvoir utiliser le package et lancer une requête HTTP
  List pays = []; // => Initialisation de la liste de pays

  /// Méthode qui permet de lancer la requête HTTP via le package Dio et récupérer la liste de tous les pays.
  getCountries() async {
    final response = await dio.get(
      "https://restcountries.com/v3.1/all?fields=name,capital,currencies",
    );
    // Mise à jour de la liste pays
    setState(() {
      pays = response.data;
    });
    // Afficher le résultat dans la console
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // **** Barre de Navigation **** 
      appBar: AppBar(
        title: Center(child: Text("Packages")),
        elevation: 18,
        actions: [
          IconButton(
            onPressed: () {
              getCountries();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      // **** Body **** 
      body: ListView.builder(
        itemCount: pays.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pays[index]["name"]["common"]),
            subtitle: Text((pays[index]["capital"] != null && pays[index]["capital"].isNotEmpty)? pays[index]["capital"][0]: "N/A",),
            // **** INITIATIVE PERSONNELLE ****
            // Rendre chaque élément cliquable pour redirection vers la page de détail
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: pays[index], // Envoyer les données du pays sélectionné
              );
            },  
          );
        },
      ),
    );
  }
}

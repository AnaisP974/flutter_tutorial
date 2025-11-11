import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final dio = Dio();
  List selectedCountry = [];

  // Le cycle de vie d’un StatefulWidget suit plusieurs étapes :
  // 1. initState() : Initialisation une seule fois, avant que le widget soit affiché
  // 2. didChangeDependencies() : Appelé juste après initState(), quand le context est disponible
  // 3. build() : Construit l’interface (appelé souvent, à chaque setState())

  // Lors de la navigation de 'home' à 'detail', je passe des données (pays sélectionné)
  // Or, dans initState(), le context n’est pas encore prêt, donc on ne peut pas appeler ModalRoute.of(context)
  // 'didChangeDependencies()' est appelé juste après qu’un context valide soit disponible
  // Ce n'est qu'à ce moment là, que l'on récupére les arguments et qu'on lance la requête API
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final country = ModalRoute.of(context)!.settings.arguments as Map;
    getInfo(country["name"]["common"]);
  }

  // Relancer une nouvelle requête
  Future<void> getInfo(String countryName) async {
    try {
      final response = await dio.get(
        "https://restcountries.com/v3.1/name/$countryName",
      );
      setState(() {
        selectedCountry = response.data;
      });
    } catch (e) {
      print("Erreur de chargement du pays : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Tant que la requête n’a pas renvoyé de données
    if (selectedCountry.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final country = selectedCountry[0];

    // Extraction sécurisée des champs
    final name = country["name"]["common"] ?? "Unknown";
    final officialName = country["name"]["official"] ?? "Unknown";
    final capital =(country["capital"] != null && country["capital"].isNotEmpty)? country["capital"][0]: "N/A";
    final region = country["region"] ?? "Unknown";
    final continents = country["continents"][0] ?? "Unknown";
    final population = country["population"] ?? "Unknown";
    final flag = country["flags"]["png"] ?? "https://tse1.mm.bing.net/th/id/OIP.dd9y0gSr3q8ruTRRpbVCMwHaEN?cb=ucfimgc2&pid=Api";


    // Les clés "currencies" et "languages" sont souvent des maps (pas des listes)
    final currency = (country["currencies"] != null)? country["currencies"].values.first["name"]: "Unknown";
    final language = (country["languages"] != null)? country["languages"].values.first: "Unknown";

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Official name: $officialName"),
            const SizedBox(height: 8),
            Image.network(flag),
            const SizedBox(height: 8),
            Text("Continent: $continents"),
            const SizedBox(height: 8),
            Text("Nb habitant: $population personnes"),
            const SizedBox(height: 8),
            Text("Capital: $capital"),
            const SizedBox(height: 8),
            Text("Region: $region"),
            const SizedBox(height: 8),
            Text("Currency: $currency"),
            const SizedBox(height: 8),
            Text("Language: $language"),
          ],
        ),
      ),
    );
  }
}

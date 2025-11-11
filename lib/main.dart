import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 13, 99, 169)),
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Changer la couleur en restant dans le même théme couleur déjà prédéfini
        // Ce que nous aurions fait :
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        title: Center(child: Text("Tutorial")),
        elevation: 14.0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      // Ce qu'il faut faire !
      drawer: Drawer(
        child: ListView(
          children: [
            // Header
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Menu"),
            ),
            // Liste des éléments du menu, cliquable
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(("Parameter")),
              subtitle: Text("Make your custom settings"),
              trailing: Icon(Icons.chevron_right),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text(("Profil")),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text(("Help")),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text(("Close")),
              onTap: (){},
            )
          ],
        ),
      ),
      body: Center(child: Text("Flutter")),
    );
  }
}

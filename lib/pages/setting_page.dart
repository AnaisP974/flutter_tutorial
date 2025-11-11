import 'package:flutter/material.dart';
import 'package:tuto2/pages/home_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Setting Page")),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            // Navigator.pop(): Supprime le dernier push pour revenir à la page d'accueil
            Navigator.pop(context);  
          }, 
          child: const Text("Home page")
        )
      ),
    );
  }
}
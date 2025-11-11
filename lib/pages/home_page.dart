import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home Page")), elevation: 18),
      body: ListView(
        padding: EdgeInsets.all(40),

        children: [
          Text(email),
          TextField(
            decoration: InputDecoration(
              hintText: "jane.doe@gmail.com",
              labelText: "Email",
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
              helperText: "Votre e-mail doit contenir un @",
              filled: true,
              fillColor: const Color.fromARGB(
                31,
                33,
                149,
                243,
              ), // Changer le bg du champ
              enabled: true, // => false, pour désactiver le champ
            ),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

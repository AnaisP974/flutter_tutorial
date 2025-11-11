import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();
  List pays = [];

  getCountries() async {
    final response = await dio.get(
      "https://restcountries.com/v3.1/all?fields=name,capital,currencies",
    );
    setState(() {
      pays = response.data;
    });
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.builder(
        itemCount: pays.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pays[index]["name"]["common"]),
            subtitle: Text(
              (pays[index]["capital"] != null && pays[index]["capital"].isNotEmpty)? pays[index]["capital"][0]: "N/A",)
                
          );
        },
      ),
    );
  }
}

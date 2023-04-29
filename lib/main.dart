import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getdatafromapi/product.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Product> _product = [];

  Future<List<Product>> fetchJson() async {
    var response = await http.get(Uri.parse(
        'https://staging-catalog-reader.qcoom.com/api/v1/banner?type=Q_FOOD'));

    List<Product> plist = [];

    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);

      for (var jsondata in urjson) {
        plist.add(Product.fromJson(jsondata));
      }
    }

    return plist;
  }

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _product.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product data"),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Card(
          child: Column(
            children: [
              Text(_product[index].bannerName.toString()),

            ],
          ),
        );
      },
      itemCount: _product.length,
      ),
    );
  }
}

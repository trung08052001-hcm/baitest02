import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internfluttertest2/shoes_model.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset(
                    "assets/images/nike.png",
                    height: 40,
                  )),
            ],
          )),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}"),
            );
          } else if (data.hasData) {
            var items = data.data as List<shoes>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                image:
                                    NetworkImage(items[index].image.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    items[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    items[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<shoes>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString("sonfile/shoes.json");
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => shoes.formJson(e)).toList();
  }
}

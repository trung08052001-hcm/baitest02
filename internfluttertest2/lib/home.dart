import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:internfluttertest2/shoes_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}"),
            );
          } else if (data.hasData) {
            var items = data.data as List<shoes>;
            itemCount:
            items == null ? 0 : items.length;
            return Container(
              child: Card(
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                        },
                        child: Container(
                          width: 300,
                          height: 300,
                          child: Image(
                            image: NetworkImage(items[0].image.toString()),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
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

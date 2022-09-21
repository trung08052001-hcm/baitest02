import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      body: Stack(children: [
        Positioned(
          top: -size.height * 0.15,
          left: -size.height * 0.20,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: size.height * 0.5,
            width: size.height * 0.5,
            decoration:
                BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
          ),
        ),
        Positioned(
          top: 20,
          left: 80,
          child: Image.asset(
            "assets/images/nike.png",
            height: 40,
          ),
        ),
        Positioned(
            top: 160,
            left: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "data",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 180,
                ),
                Text(
                  "Money",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        // Positioned(
        //     top: 180,
        //     left: 80,
        //     child: ListView.builder(
        //         itemCount: 3,
        //         itemBuilder: (context, index) {
        //           return Positioned(
        //             child: Image.asset("assets/images/nike.png"),
        //           );
        //         }))
      ]),
    );
  }
}

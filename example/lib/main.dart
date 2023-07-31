import 'dart:async';

import 'package:flutter/material.dart';
import 'package:textrich/textrich.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TextRich example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextRich(
                "TextRich example app",
                matchTexts: const ["exa"],
                matchStyles: const [TextStyle(color: Colors.red)],
              ),
              TextRich(
                "TextRich example app",
                matchTexts: const ["exa", "a"],
                matchStyles: const [TextStyle(color: Colors.red)],
              ),
              TextRich(
                "TextRich example app",
                matchTexts: const ["exa", "a"],
                matchStyles: const [TextStyle(color: Colors.red), TextStyle(color: Colors.blue)],
              ),
              TextRich(
                "TextRich example app",
                matchTexts: const ["exa", "a"],
                matchStyles: const [TextStyle(color: Colors.red,fontStyle: FontStyle.italic,fontSize: 30,decoration: TextDecoration.underline), TextStyle(color: Colors.blue)],
                onTap: (value){
                  print('Tap value :$value');
                },
                style: const TextStyle(color: Colors.black,fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

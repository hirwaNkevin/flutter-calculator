// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:mobile_programming/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Programming app',
      theme: ThemeData.light(),
      // home: const MyHomePage(title: 'Mobile Programming'),
      home: const Calculatorscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const Center(child: Text('Hello Home')));
  }
}

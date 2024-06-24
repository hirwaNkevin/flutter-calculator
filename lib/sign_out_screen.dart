import 'package:flutter/material.dart';

class Signoutscreen extends StatefulWidget {
  const Signoutscreen({super.key});

  @override
  State<Signoutscreen> createState() => _SignoutscreenState();
}

class _SignoutscreenState extends State<Signoutscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sign Out'),
      ),
      body: const Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                'Sign Out',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

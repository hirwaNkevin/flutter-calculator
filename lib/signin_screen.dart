import 'package:flutter/material.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sign In'),
      ),
      body: const Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                'Sign In',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

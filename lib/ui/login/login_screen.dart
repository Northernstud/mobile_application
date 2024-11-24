import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: const Text("one")),
          ElevatedButton(onPressed: (){}, child: const Text("two")),
          ElevatedButton(onPressed: (){}, child: const Text("three")),
        ],
        )
    );
  }
}

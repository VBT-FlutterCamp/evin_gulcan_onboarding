import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Tittle'),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Tittle'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Tittle'),
          )
        ],
      ),
    );
  }
}

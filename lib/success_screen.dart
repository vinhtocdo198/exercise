import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Successful')),
      body: const Center(
          child: Text(
        'CONGRATULATIONS!',
        style: TextStyle(fontSize: 30.0),
      )),
    );
  }
}

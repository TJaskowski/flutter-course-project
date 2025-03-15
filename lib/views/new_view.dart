import 'package:flutter/material.dart';

class NewView extends StatelessWidget {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New View'),
      ),
      body: const Center(
        child: Text('This is a new view'),
      ),
    );
  }
}
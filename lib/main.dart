import 'package:flutter/material.dart';
import 'package:mobile_app/views/home.dart';
import 'package:mobile_app/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(), // NewView(),
    );
  }
}


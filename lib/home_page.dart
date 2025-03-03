import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data_fetcher.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    DataFetcher().getData();
    return const Scaffold(
      
    );
  }
}
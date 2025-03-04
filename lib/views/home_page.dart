import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/currency_data.dart';
import '../data_fetcher.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    DataFetcher().getData();
    
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CurrencyData(currencyCode: 'chf'),
            CurrencyData(currencyCode: 'usd'),
            CurrencyData(currencyCode: 'eur'),
          ],
        ),
      ),
      );
      
    
  }
}
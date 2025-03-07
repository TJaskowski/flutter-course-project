import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/currency_data.dart';
import 'package:mobile_app/widgets/currency_form.dart';
import '../data_fetcher.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    const url = 'https://api.nbp.pl/api/exchangerates/rates/a';
    const currencyCode = 'chf';
    DataFetcher().getData();
    return const Scaffold(
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CurrencyData(currencyCode: currencyCode, urlLink: url),
            SizedBox(height: 20),
            CurrencyForm(urlLink: url),
          ],
        ),
        ));
      
    
  }
}
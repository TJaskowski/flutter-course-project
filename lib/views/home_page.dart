import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/currency_data.dart';
import '../data_fetcher.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    const url = 'https://api.nbp.pl/api/exchangerates/rates/a';
    DataFetcher().getData();
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("fafa")
                // CurrencyData(currencyCode: 'chf', urlLink: url,),
                // CurrencyData(currencyCode: 'usd', urlLink: url,),
                // CurrencyData(currencyCode: 'eur', urlLink: url,),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
              ],
            )
          ],
        ),
      ),
      );
      
    
  }
}
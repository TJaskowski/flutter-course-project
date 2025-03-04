import 'package:flutter/material.dart';
import 'package:mobile_app/core/api_client.dart';
import 'package:mobile_app/models/currency.dart';
import 'package:mobile_app/services/currency_service.dart';

class CurrencyData extends StatefulWidget {
  final String currencyCode;

  const CurrencyData({super.key, required this.currencyCode});

  @override
  State<CurrencyData> createState() => _CurrencyDataState();
}

class _CurrencyDataState extends State<CurrencyData> {
  late CurrencyService currencyService;
  late Future<Currency> currency;
  
  @override
  void initState() {
    super.initState();
    currencyService = CurrencyService(apiClient: ApiClient(baseUrl: 'https://api.nbp.pl/api/exchangerates/rates/a'));
    currency = currencyService.getCurrency(widget.currencyCode);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Currency>(
      future: currency,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if(snapshot.hasError) {
          return const Center(child: Text('hasError'));
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(' ${snapshot.data!.currencyName}'),
               // Text('Code: ${snapshot.data!.currencySymbol}'),
              //  Text('Mid: ${snapshot.data!.price}'),
              ],
            ),
          );
        }
      });
  }
}
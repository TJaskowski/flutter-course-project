import 'package:flutter/material.dart';
import 'package:mobile_app/core/api_client.dart';
import 'package:mobile_app/models/currency.dart';
import 'package:mobile_app/services/api_service.dart';

class CurrencyData extends StatefulWidget {
  final String currencyCode;
  final String urlLink;

  const CurrencyData({super.key, required this.currencyCode, required this.urlLink});

  @override
  State<CurrencyData> createState() => _CurrencyDataState();
}

class _CurrencyDataState extends State<CurrencyData> {
  late ApiService currencyService;
  late Future<Currency> currency;
  
  @override
  void initState() {
    super.initState();
    currencyService = ApiService(apiClient: ApiClient(baseUrl: widget.urlLink));
    currency = currencyService.getData(widget.currencyCode, (data) => Currency.fromJson(data));
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
                Text('Code: ${snapshot.data!.currencySymbol}'),
                Text('Mid: ${snapshot.data!.price}'),
              ],
            ),
          );
        }
      });
  }
}
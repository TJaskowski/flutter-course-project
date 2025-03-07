import 'package:flutter/material.dart';
import 'package:mobile_app/core/api_client.dart';
import 'package:mobile_app/models/currency.dart';
import 'package:mobile_app/services/api_service.dart';

class CurrencyForm extends StatefulWidget {
  final String urlLink;

  const CurrencyForm({super.key, required this.urlLink});

  @override
  State<CurrencyForm> createState() => _CurrencyFormState();
}

class _CurrencyFormState extends State<CurrencyForm> {
  final TextEditingController _currencyController = TextEditingController();
  String? currencyValue;
  bool isLoading = false;

  Future<void> fetchCurrency() async {
    final currencyCode = _currencyController.text;

    setState(() {
      isLoading = true;
    });
    try {
      final currencyService =
          ApiService(apiClient: ApiClient(baseUrl: widget.urlLink));
      final Currency currency = await currencyService.getData(
          currencyCode, (data) => Currency.fromJson(data));
      setState(() {
        currencyValue =
            "Currency: ${currency.currencyName}\nValue: ${currency.price} PLN";
      });
    } catch (e) {
      setState(() {
        currencyValue = 'Error: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _currencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                currencyValue ?? 'Wpisz kod waluty i zatwierdz',
                style: const TextStyle(fontSize: 20))
        ),
           SizedBox(
          width: 100,
          child: TextField(
            controller: _currencyController,
            decoration: const InputDecoration(
              hintText: 'code',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            fetchCurrency();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

import 'package:mobile_app/core/api_client.dart';
import 'package:mobile_app/models/currency.dart';

class CurrencyService {
  final ApiClient apiClient;
  CurrencyService({required this.apiClient});

  Future<Currency> getCurrency(String currencyCode) async {
    final data = await apiClient.get('/$currencyCode');
    return Currency.fromJson(data);
  }
}
import 'package:mobile_app/core/api_client.dart';

class ApiService {
  final ApiClient apiClient;

  ApiService({required this.apiClient});

  Future<T> getData<T>(String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    final data = await apiClient.get('/$endpoint');
    return fromJson(data);
  }
}
// The ApiService class is responsible for fetching data from the server.
// It uses the ApiClient class to make HTTP requests and returns the data in the specified format.
// The getData method takes an endpoint and a function to convert the JSON data to the desired object.
// This method fetches the data from the server, converts it to a Map, and then uses the provided function to convert it to the desired object.
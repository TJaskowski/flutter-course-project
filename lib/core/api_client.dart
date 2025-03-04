import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<dynamic> get(String path) async {
    final response = await http.get(Uri.parse('$baseUrl$path'));
    if(response.statusCode == 200) {
     // print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

}
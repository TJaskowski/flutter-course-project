import 'dart:convert';

import 'package:http/http.dart' as http;

class DataFetcher {
    Future getData() async {
    var response = await http.get(Uri.https('api.nbp.pl' , '/api/exchangerates/rates/a/chf/'));
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    print(response.body);
  }

}
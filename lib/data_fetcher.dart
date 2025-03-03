import 'package:http/http.dart' as http;

class DataFetcher {
    Future getData() async {
    var response = await http.get(Uri.https('api.nbp.pl' , '/api/cenyzlota/'));
    print(response.body);
  }

}
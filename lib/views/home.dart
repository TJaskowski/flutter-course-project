import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/joke.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  Joke  joke = Joke(id: 0, type: '', setup: 'tytytyty', punchline: '');
  late Future<Joke> future;

  Future<Joke>getData() async {
    var url = Uri.parse('https://official-joke-api.appspot.com/random_joke');
    var response = await http.get(url);
    if(response.statusCode == 200){
      return Joke.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load data');
    }
  }

  void refreshData() {
    future = getData();
    setState(() { });
  }

  // void refreshData() {
  //   getData().then((value){
  //     joke = value;
  //         setState(() { });
  //   });

  // }

  // @override
  // void refreshData() async {
  //   joke = await getData();
  //   setState(() {
  //   });
  // }

  @override
  void initState() {
    super.initState();
    future = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
FutureBuilder(future: future,
 builder: (context, snapshot) {
  if(snapshot.hasData) {
    return 
        Center(
          child: Text(snapshot.data!.setup),
        );
        }
        else {
          return CircularProgressIndicator();
        }
        }),
        SizedBox(height: 20),
        ElevatedButton(onPressed: refreshData, child: Text("Nowy zart")),
      ],
    );
  }
}
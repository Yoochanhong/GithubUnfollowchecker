import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class follow {
  String? name;

  follow({this.name});

  follow.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

Future<follow> getFollowApi() async {
  final response = await http.get(Uri.parse('https://api.github.com/users/Yoochanhong/following'));
  print(response.body);
  if (response.statusCode == 200){
    return follow.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('예외');
  }
}
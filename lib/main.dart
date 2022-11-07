import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_unfollow_checker/model.dart';
import 'package:github_unfollow_checker/token.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
    follow = getFollowApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
    );
  }
}

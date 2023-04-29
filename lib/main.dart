import 'package:flutter/material.dart';
import 'package:github_unfollow_checker/View/login_page.dart';
import 'package:github_unfollow_checker/ViewModel/unfollow_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<UnfollowViewModel>(
        create: (context) => UnfollowViewModel(),
        child: const LoginPage(),
      ),
    );
  }
}

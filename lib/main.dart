import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:github_unfollow_checker/model.dart';


class FollowList {
  final List<Follow>? follow;

  FollowList({this.follow});

  factory FollowList.fromJson(List<dynamic> json) {
    List<Follow> follow = <Follow>[];
    follow = json.map((i) => Follow.fromJson(i)).toList();

    return FollowList(
      follow: follow,
    );
  }
}

Future<FollowList> getFollowApi() async {
  final response = await http
      .get(Uri.parse('https://api.github.com/users/Yoochanhong/following?per_page=100'));
  print(response.body);
  if (response.statusCode == 200) {
    return FollowList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('예외');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<FollowList>? follow;

  @override
  void initState() {
    super.initState();
    follow = getFollowApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: follow,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        width: 300,
                        height: 500,
                        child: ListView.builder(
                          itemCount: snapshot.data!.follow!.length,
                          itemBuilder: (context, index) {
                            return Text(snapshot.data!.follow![index].login.toString());
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('에러 엄');
                    } else {
                      return Text('실패');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

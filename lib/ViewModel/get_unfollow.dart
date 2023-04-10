import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:github_unfollow_checker/Model/user_list.dart';

Future<UserList> getUnfollow(String userName, String queryName) async {
  final response = await http
      .get(Uri.parse("http://localhost:8080/$queryName?userName=$userName"));
  if (response.statusCode == 200) {
    return UserList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("존재하지 않는 유저");
  }
}

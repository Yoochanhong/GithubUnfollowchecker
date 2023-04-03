import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:github_unfollow_checker/Model/user_list.dart';

Future<UserList> getFollowApi(String userName) async {
  final response = await http
      .get(Uri.parse('http://localhost:8080/unfollower?userName=$userName'));
  if (response.statusCode == 200) {
    return UserList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('예외');
  }
}

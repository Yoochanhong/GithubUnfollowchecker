import 'package:github_unfollow_checker/Model/user.dart';
import 'package:github_unfollow_checker/Model/user_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataSource {
  Future<UserList> _getUserList(String queryName, userName) async {
    final response = await http
        .get(Uri.parse("http://localhost:8080/$queryName?userName=$userName"));
    if (response.statusCode == 200) {
      return UserList.fromJson(jsonDecode(response.body));
    } else {
      List<User> list = List.empty(growable: true);
      list.add(User(login: "2", avatarUrl: "2", htmlUrl: "2", type: "2"));
      return UserList(user: list);
    }
  }

  Future<List<User>> getUserList(String queryName, userName) =>
      _getUserList(queryName, userName).then((value) => value.user!);
}

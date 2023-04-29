import 'package:github_unfollow_checker/Model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataSource {
  Future<List<User>> getUserList(String queryName, String userName) async {
    final response = await http
        .get(Uri.parse("http://localhost:8080/$queryName?userName=$userName"));
    if (response.statusCode == 200) {
      List<User> user = <User>[];
      user = jsonDecode(response.body).map((i) => User.fromJson(i)).toList();
      return user;
    }
    throw Exception("존재하지 않는 유저");
  }
}

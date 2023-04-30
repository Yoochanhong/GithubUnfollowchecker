import 'package:github_unfollow_checker/Model/user.dart';
import 'package:github_unfollow_checker/Model/user_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataSource {
  Future<UserList> _getUserList() async {
    final response = await http.get(
        Uri.parse("http://localhost:8080/unfollowers?userName=yoochanhong"));
    if (response.statusCode == 200) {
      return UserList.fromJson(jsonDecode(response.body));
    }
    throw Exception("존재하지 않는 유저");
  }

  Future<List<User>> getUserList() =>
      _getUserList().then((value) => value.user!);
}

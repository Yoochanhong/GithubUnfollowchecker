import 'package:http/http.dart' as http;
import 'package:github_unfollow_checker/token.dart';
import 'dart:convert';
import 'package:github_unfollow_checker/Model/follow_list.dart';

Future<FollowList> getFollowApi(String userName) async {
  final response = await http.get(
      Uri.parse(
          'https://api.github.com/users/$userName/following?per_page=100'),
      headers: {'Authorization': 'Bearer $yourToken'});
  print(response.body);
  if (response.statusCode == 200) {
    return FollowList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('예외');
  }
}

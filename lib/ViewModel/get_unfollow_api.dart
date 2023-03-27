import 'package:http/http.dart' as http;
import 'package:github_unfollow_checker/token.dart';

Future<int> getUnfollowApi(String login, String userName) async {
  final response = await http.get(
      Uri.parse('https://api.github.com/users/$login/following/$userName'),
      headers: {'Authorization': 'Bearer $yourToken'});
  if (response.statusCode == 404) {
    return 1;
  } else {
    return 0;
  }
}

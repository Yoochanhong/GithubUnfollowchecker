import 'package:http/http.dart' as http;
import 'package:github_unfollow_checker/token.dart';

Future<String> getUnfollowingApi(String login, String userName) async {
  final response = await http.get(
      Uri.parse('https://api.github.com/users/$userName/following/$login'),
      headers: {'Authorization': 'Bearer $yourToken'});
  print(response.body);
  if (response.statusCode == 404) {
    print(login);
    return login;
  } else {
    throw Exception('요청 한도초과');
  }
}

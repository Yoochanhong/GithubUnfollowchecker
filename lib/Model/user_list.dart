import 'package:github_unfollow_checker/Model/user.dart';

class UserList {
  final List<User>? user;

  UserList({this.user});

  factory UserList.fromJson(List<dynamic> json) {
    List<User> user = <User>[];
    user = json.map((i) => User.fromJson(i)).toList();

    return UserList(
      user: user,
    );
  }
}

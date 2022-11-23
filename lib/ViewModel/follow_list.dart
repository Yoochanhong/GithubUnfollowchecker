import 'package:github_unfollow_checker/Model/model.dart';

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
import 'package:flutter/foundation.dart';
import 'package:github_unfollow_checker/Model/user.dart';
import 'package:github_unfollow_checker/Repository/unfollow_repository.dart';

class UnfollowViewModel with ChangeNotifier {
  late final UnfollowRepository _repository;
  List<User> _userList = List.empty(growable: true);
  List<User> _backupList = List.empty(growable: true);

  List<User> get userList => _userList;

  UnfollowViewModel() {
    _repository = UnfollowRepository();
  }

  Future getUserList(String queryName, userName) async {
    _userList = List.empty();
    notifyListeners();
    _userList = await _repository.getUserList(queryName, userName);
    _backupList = _userList;
    notifyListeners();
  }

  void search(String query) {
    List<User> result = List.empty(growable: true);
    for (User user in _backupList) {
      if (user.login!.contains(query)) {
        result.add(user);
      }
    }
    if (result.isEmpty) {
      User user = User(
          login: "검색결과가 존재하지 않습니다.",
          htmlUrl: "https://github.com/asdfsdgdfgr",
          avatarUrl:
              "https://search.pstatic.net/sunny/?src=https%3A%2F%2Flive.staticflickr.com%2F3505%2F4070809932_21ff533bed.jpg&type=sc960_832");
      result.add(user);
    }
    _userList = result;
    notifyListeners();
  }
}

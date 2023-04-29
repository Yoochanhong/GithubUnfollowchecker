import 'package:flutter/foundation.dart';
import 'package:github_unfollow_checker/Model/user_list.dart';
import 'package:github_unfollow_checker/Repository/unfollow_repository.dart';

class UnfollowViewModel with ChangeNotifier {
  final UnfollowRepository _repository = UnfollowRepository();
  UserList _userList = UserList(user: List.empty(growable: true));

  UserList get userList => _userList;

  Future getUserList(String queryName, userName) async {
    _userList = await _repository.getUserList(queryName, userName);
    notifyListeners();
  }
}

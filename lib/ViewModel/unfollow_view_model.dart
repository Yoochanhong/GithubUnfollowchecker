import 'package:flutter/foundation.dart';
import 'package:github_unfollow_checker/Model/user.dart';
import 'package:github_unfollow_checker/Repository/unfollow_repository.dart';

class UnfollowViewModel with ChangeNotifier {
  final UnfollowRepository _repository = UnfollowRepository();
  List<User> _userList = List.empty(growable: true);

  List<User> get userList => _userList;

  Future getUserList(String queryName, userName) async {
    _userList = await _repository.getUserList(queryName, userName);
    notifyListeners();
  }
}

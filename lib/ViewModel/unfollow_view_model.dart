import 'package:flutter/foundation.dart';
import 'package:github_unfollow_checker/Model/user_list.dart';
import 'package:github_unfollow_checker/Repository/unfollow_repository.dart';

class UnfollowViewModel with ChangeNotifier {
  late final UnfollowRepository _repository;
  UserList _userList = UserList(user: List.empty(growable: true));
  final String _queryName, _userName;

  UnfollowViewModel(this._queryName, this._userName) {
    _queryName;
    _userName;
    _repository = UnfollowRepository();
    _getUserList();
  }

  UserList get userList => _userList;

  Future _getUserList() async {
    _userList = await _repository.getUserList(_queryName, _userName);
    notifyListeners();
  }
}

import 'package:github_unfollow_checker/DataSource/data_source.dart';
import 'package:github_unfollow_checker/Model/user_list.dart';

class UnfollowRepository {
  final DataSource _dataSource = DataSource();

  Future<UserList> getUserList(String queryName, String userName) =>
      _dataSource.getUserList(queryName, userName);
}

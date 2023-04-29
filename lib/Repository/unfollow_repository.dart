import 'package:github_unfollow_checker/DataSource/data_source.dart';
import 'package:github_unfollow_checker/Model/user.dart';

class UnfollowRepository {
  final DataSource _dataSource = DataSource();

  Future<List<User>> getUserList(String queryName, String userName) =>
      _dataSource.getUserList(queryName, userName);
}

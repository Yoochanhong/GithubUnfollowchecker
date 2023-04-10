class User {
  String? login;
  String? avatarUrl;
  String? htmlUrl;

  User({this.login, this.avatarUrl, this.htmlUrl});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['avatar_url'] = avatarUrl;
    data['html_url'] = htmlUrl;
    return data;
  }
}

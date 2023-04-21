class User {
  String? login;
  String? avatarUrl;
  String? htmlUrl;
  String? type;

  User({this.login, this.avatarUrl, this.htmlUrl, this.type});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['avatar_url'] = avatarUrl;
    data['html_url'] = htmlUrl;
    data['type'] = type;
    return data;
  }
}

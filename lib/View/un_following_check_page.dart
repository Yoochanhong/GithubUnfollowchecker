import 'package:flutter/material.dart';
import 'package:github_unfollow_checker/View/web_view.dart';
import 'package:github_unfollow_checker/Model/user_list.dart';
import 'package:github_unfollow_checker/ViewModel/get_unfollow.dart';
import 'package:github_unfollow_checker/Model/user.dart';

class UnFollowingCheckpage extends StatefulWidget {
  UnFollowingCheckpage({Key? key, required this.userName}) : super(key: key);

  String userName;

  @override
  State<UnFollowingCheckpage> createState() => _UnFollowingCheckpageState();
}

class _UnFollowingCheckpageState extends State<UnFollowingCheckpage> {
  Future<UserList>? unfollowing;
  List<User> list = List.empty(growable: true);
  List<User> searchResult = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    unfollowing = getUnfollow(widget.userName, "unfollowing").then((value) {
      for (int i = 0; i < value.user!.length; i++) {
        list.add(value.user![i]);
      }
      return value;
    });
  }

  List<User> search(String query) {
    List<User> result = List.empty(growable: true);
    for (User user in list) {
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
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchResult = search(value);
            });
          },
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: unfollowing,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.user![0].htmlUrl == "1") {
                return Column(
                  children: [
                    const SizedBox(height: 50.0),
                    Image.asset("assets/app-logo.png", width: 200),
                    const SizedBox(height: 60.0),
                    Column(
                      children: const [
                        Text(
                          "대단해요!",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          "모든 사람들을 팔로우하셨군요 ^_^",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height - 200,
                  child: ListView.builder(
                    itemCount: searchResult.isEmpty
                        ? list.length
                        : searchResult.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 13.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: ListTile(
                          leading: Image.network(searchResult.isEmpty
                              ? list[index].avatarUrl.toString()
                              : searchResult[index].avatarUrl.toString()),
                          title: Text(searchResult.isEmpty
                              ? list[index].login.toString()
                              : searchResult[index].login.toString()),
                          onLongPress: () {
                            String url = searchResult.isEmpty
                                ? list[index].htmlUrl.toString()
                                : searchResult[index].htmlUrl.toString();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebViewScreen(url: url),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 65),
                    child: Image.asset(
                      'assets/noPerson.png',
                      width: 200,
                    ),
                  ),
                  const Text(
                    '존재하지 않는 유저입니다.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

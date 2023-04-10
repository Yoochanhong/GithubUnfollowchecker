import 'package:flutter/material.dart';
import 'package:github_unfollow_checker/View/web_view.dart';
import 'package:github_unfollow_checker/Model/user_list.dart';
import 'package:github_unfollow_checker/ViewModel/get_unfollowing.dart';

class UnFollowingCheckpage extends StatefulWidget {
  UnFollowingCheckpage({Key? key, required this.userName}) : super(key: key);

  String userName;

  @override
  State<UnFollowingCheckpage> createState() => _UnFollowingCheckpageState();
}

class _UnFollowingCheckpageState extends State<UnFollowingCheckpage> {
  Future<UserList>? unfollowing;

  @override
  void initState() {
    super.initState();
    unfollowing = getUnfollowingApi(widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: FutureBuilder(
          future: unfollowing,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.user![0].htmlUrl == "1") return Text("얘 없음");
              return SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height - 200,
                child: ListView.builder(
                  itemCount: snapshot.data!.user!.length,
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
                        leading: Image.network(
                            snapshot.data!.user![index].avatarUrl.toString()),
                        title:
                            Text(snapshot.data!.user![index].login.toString()),
                        onLongPress: () {
                          String url =
                              snapshot.data!.user![index].htmlUrl.toString();
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

import 'package:flutter/material.dart';
import 'package:github_unfollow_checker/View/web_view.dart';
import 'package:github_unfollow_checker/Model/user_list.dart';
import 'package:github_unfollow_checker/ViewModel/get_unfollowers.dart';

class UnFollowCheckpage extends StatefulWidget {
  UnFollowCheckpage({Key? key, required this.userName}) : super(key: key);

  String userName;

  @override
  State<UnFollowCheckpage> createState() => _UnFollowCheckpageState();
}

class _UnFollowCheckpageState extends State<UnFollowCheckpage> {
  Future<UserList>? unfollower;

  @override
  void initState() {
    super.initState();
    unfollower = getUnfollowerApi(widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: FutureBuilder(
          future: unfollower,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width: 300,
                height: 500,
                child: ListView.builder(
                  itemCount: snapshot.data!.user!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                          snapshot.data!.user![index].avatarUrl.toString()),
                      title: Text(snapshot.data!.user![index].login.toString()),
                      onLongPress: () {
                        String url =
                            snapshot.data!.user![index].htmlUrl.toString();
                        Get.to(WebViewScreen(), arguments: url);
                      },
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

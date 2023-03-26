import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_unfollow_checker/View/web_view.dart';
import 'package:github_unfollow_checker/Model/follow_list.dart';
import 'package:github_unfollow_checker/ViewModel/get_following_api.dart';
import 'package:github_unfollow_checker/ViewModel/get_unfollowing_api.dart';

class UnFollowingCheckpage extends StatefulWidget {
  const UnFollowingCheckpage({Key? key}) : super(key: key);

  @override
  State<UnFollowingCheckpage> createState() => _UnFollowingCheckpageState();
}

class _UnFollowingCheckpageState extends State<UnFollowingCheckpage> {
  Future<FollowList>? follower;
  Future<String>? unfollowing;

  @override
  void initState() {
    super.initState();
    follower = getFollowingApi(Get.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: FutureBuilder(
          future: follower,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width: 300,
                height: 500,
                child: ListView.builder(
                  itemCount: snapshot.data!.follow!.length,
                  itemBuilder: (context, index) {
                    unfollowing = getUnfollowingApi(
                        snapshot.data!.follow![index].login.toString(),
                        Get.arguments);
                    return FutureBuilder(
                      future: unfollowing,
                      builder: (context, snapshot1) {
                        if (snapshot1.hasData) {
                          return ListTile(
                            leading: Image.network(snapshot
                                .data!.follow![index].avatarUrl
                                .toString()),
                            title: Text(snapshot1.data.toString()),
                            onLongPress: () {
                              String url = snapshot.data!.follow![index].htmlUrl
                                  .toString();
                              Get.to(WebViewScreen(), arguments: url);
                            },
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
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

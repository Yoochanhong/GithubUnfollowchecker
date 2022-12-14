import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_unfollow_checker/View/web_view.dart';
import 'package:github_unfollow_checker/ViewModel/follow_list.dart';
import 'package:github_unfollow_checker/ViewModel/get_follow_api.dart';
import 'package:github_unfollow_checker/ViewModel/get_unfollow_api.dart';

class UnFollowCheckpage extends StatefulWidget {
  const UnFollowCheckpage({Key? key}) : super(key: key);

  @override
  State<UnFollowCheckpage> createState() => _UnFollowCheckpageState();
}

class _UnFollowCheckpageState extends State<UnFollowCheckpage> {
  Future<FollowList>? following;
  Future<String>? unfollower;

  @override
  void initState() {
    super.initState();
    following = getFollowApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SizedBox(
        child: Center(
          child: FutureBuilder(
            future: following,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  width: 300,
                  height: 500,
                  child: ListView.builder(
                    itemCount: snapshot.data!.follow!.length,
                    itemBuilder: (context, index) {
                      unfollower = getUnfollowApi(
                          snapshot.data!.follow![index].login.toString());
                      return FutureBuilder(
                        future: unfollower,
                        builder: (context, snapshot1) {
                          if (snapshot1.hasData) {
                            return ListTile(
                              leading: Image.network(snapshot
                                  .data!.follow![index].avatarUrl
                                  .toString()),
                              title: Text(snapshot1.data.toString()),
                              onLongPress: () {
                                String url = snapshot
                                    .data!.follow![index].htmlUrl
                                    .toString();
                                Get.to(const WebViewScreen(), arguments: url);
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
                      '???????????? ?????? ???????????????.',
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
      ),
    );
  }
}

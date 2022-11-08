import 'package:flutter/material.dart';
import 'package:github_unfollow_checker/follow_list.dart';
import 'package:github_unfollow_checker/get_follow_api.dart';
import 'package:github_unfollow_checker/get_unfollow_api.dart';

class UnFollowCheckpage extends StatefulWidget {
  const UnFollowCheckpage({Key? key}) : super(key: key);

  @override
  State<UnFollowCheckpage> createState() => _UnFollowCheckpageState();
}

class _UnFollowCheckpageState extends State<UnFollowCheckpage> {
  Future<FollowList>? follow;
  Future<String>? unfollow;

  @override
  void initState() {
    super.initState();
    follow = getFollowApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: follow,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: 300,
                      height: 500,
                      child: ListView.builder(
                        itemCount: snapshot.data!.follow!.length,
                        itemBuilder: (context, index) {
                          unfollow = getUnfollowApi(
                              snapshot.data!.follow![index].login.toString());
                          return FutureBuilder(
                            future: unfollow,
                            builder: (context, snapshot1) {
                              if (snapshot1.hasData) {
                                return ListTile(
                                  leading: Image.network(snapshot
                                      .data!.follow![index].avatarUrl
                                      .toString()),
                                  title: Text(snapshot1.data.toString()),
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('에러');
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

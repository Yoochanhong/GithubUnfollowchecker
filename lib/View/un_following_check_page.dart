import 'package:flutter/material.dart';
import 'package:github_unfollow_checker/View/web_view.dart';
import 'package:provider/provider.dart';
import 'package:github_unfollow_checker/ViewModel/unfollow_view_model.dart';

class UnFollowingCheckPage extends StatelessWidget {
  UnFollowingCheckPage({Key? key}) : super(key: key);
  late UnfollowViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<UnfollowViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            viewModel.search(value);
          },
        ),
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: viewModel.userList.isNotEmpty
            ? viewModel.userList[0].htmlUrl == "1"
                ? Column(
                    children: [
                      const SizedBox(height: 50.0),
                      Image.asset("assets/app-logo.png", width: 200),
                      const SizedBox(height: 60.0),
                      const Column(
                        children: [
                          Text(
                            "축하드립니다!",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            "모든 사람들을 팔로잉하고 있군요 ^_^",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : viewModel.userList[0].htmlUrl == "2"
                    ? Column(
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
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        height: MediaQuery.of(context).size.height - 200,
                        child: ListView.builder(
                          itemCount: viewModel.userList.length,
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
                                leading: Image.network(viewModel
                                    .userList[index].avatarUrl
                                    .toString()),
                                title: Text(
                                    viewModel.userList[index].login.toString()),
                                onLongPress: () {
                                  String url = viewModel.userList[index].htmlUrl
                                      .toString();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WebViewScreen(url: url),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

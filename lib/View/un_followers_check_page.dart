import 'package:flutter/material.dart';
import 'package:github_unfollow_checker/View/web_view.dart';
import 'package:provider/provider.dart';
import 'package:github_unfollow_checker/ViewModel/unfollow_view_model.dart';

class UnFollowCheckpage extends StatelessWidget {
  UnFollowCheckpage({Key? key}) : super(key: key);
  late UnfollowViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<UnfollowViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: viewModel.userList.isNotEmpty
            ? SizedBox(
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
                        leading: Image.network(
                            viewModel.userList[index].avatarUrl.toString()),
                        title: Text(viewModel.userList[index].login.toString()),
                        onLongPress: () {
                          String url =
                              viewModel.userList[index].htmlUrl.toString();
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
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

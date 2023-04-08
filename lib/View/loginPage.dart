import 'package:flutter/material.dart';
import 'package:github_unfollow_checker/View/unFollowCheckPage.dart';
import 'package:github_unfollow_checker/View/unFollowingCheckPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 65),
            child: Image.asset(
              'assets/app-logo.png',
              width: 150,
            ),
          ),
          const Text(
            '키보드에서 입력하면 언팔로워 체크로 자동으로 넘어가요..!',
            style: TextStyle(fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10, left: 20.0, bottom: 20.0, right: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formkey,
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '깃허브 아이디를 입력해주세요.'),
                  keyboardType: TextInputType.name,
                  validator: (value) => value!.isEmpty ? '아이디를 입력해주세요.' : null,
                  onFieldSubmitted: (String str) {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UnFollowCheckpage(userName: str),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UnFollowCheckpage(userName: controller.text),
                      ),
                    );
                  }
                },
                child: const Text('언팔로워 체크'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UnFollowingCheckpage(userName: controller.text),
                      ),
                    );
                  }
                },
                child: const Text('언팔로잉 체크'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

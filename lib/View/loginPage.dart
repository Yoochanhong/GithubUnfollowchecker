import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_unfollow_checker/View/unFollowCheckPage.dart';

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
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 65),
            child: Image.asset(
              'assets/app-logo.png',
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formkey,
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '깃허브 아이디를 입력해주세요.'),
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                  value!.isEmpty ? '아이디를 입력해주세요.' : null,
                  onFieldSubmitted: (String str) {
                    if (_formkey.currentState!.validate()) {
                    Get.to(UnFollowCheckpage(), arguments: str);
                    }
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                Get.to(UnFollowCheckpage(), arguments: controller.text);
              }
            },
            child: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

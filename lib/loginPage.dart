import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_unfollow_checker/unFollowCheckPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    //final formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        child: Column(
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
                  //key: formkey,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return '아이디를 입력해주세요.';
                      return null;
                    },
                    controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '깃허브 아이디를 입력해주세요.'),
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (String str) {
                      //if (formkey.currentState!.validate()) {
                        Get.to(UnFollowCheckpage(), arguments: str);
                        print(str);
                      //}
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //if (formkey.currentState!.validate()) {
                  Get.to(UnFollowCheckpage(), arguments: controller.text);
                  print(controller.text);
                //}
              },
              child: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('gitHubUnFollowChecker'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '깃허브 아이디를 입력해주세요.'
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('버튼'),
            ),
          ],
        ),
      ),
    );
  }
}

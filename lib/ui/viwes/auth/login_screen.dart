import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                "Login Screen",
                style: TextStyle(
                    color: Color(0xffDC143C),
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 40,),

            SizedBox(height: 30,),

            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInPage extends StatefulWidget {
  static String routeName = "/sign_in";
  const SignInPage({Key? key}) : super(key: key);

  @override
  SignInScreen createState() => SignInScreen();
}

class SignInScreen extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Body(),
    );
  }
}

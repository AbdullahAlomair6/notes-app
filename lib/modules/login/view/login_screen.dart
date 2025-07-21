import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/app_routes.dart';
import 'package:notes_app/custom-widget/widget/custom_button.dart';

import '../../../custom-widget/widget/custom_edittext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _mainScreen(),
            SizedBox(height: 30),
            _button(),
            SizedBox(height: 20),
            _accountRegister(),
          ],
        ),
      ),
    );
  }

  Widget _mainScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 150),
        Text(
          'Login',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Text(
          'Login to use App',
          style: TextStyle(fontSize: 20, color: Colors.blueGrey),
        ),
        SizedBox(height: 40),
        Text(
          'Email',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        CustomEdittext(
          hint: 'Enter your Email',
          type: TextFormFieldType.email,
          controller: emailController,
        ),
        SizedBox(height: 40),
        Text(
          'Password',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        CustomEdittext(
          hint: 'Enter your password',
          type: TextFormFieldType.password,
          controller: passwordController,
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.topRight,
          child: Text('Forgot Password?', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  Widget _button() {
    return Column(
      children: [
        CustomButton(text: 'Login', onPressed: () {}),
        SizedBox(height: 30),
        CustomButton(
          text: 'Login with Google',
          onPressed: () {},
          color: Colors.red,
        ),
      ],
    );
  }

  Widget _accountRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an Account?", style: TextStyle(fontSize: 18)),
        SizedBox(width: 5),
        InkWell(
          onTap: () {
            GoRouter.of(context).pushNamed('signupScreen');
          },
          child: Text(
            'Click here',
            style: TextStyle(fontSize: 18, color: Colors.orangeAccent),
          ),
        ),
      ],
    );
  }
}

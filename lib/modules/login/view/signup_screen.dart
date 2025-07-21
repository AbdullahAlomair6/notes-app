import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/custom-widget/widget/custom_button.dart';

import '../../../custom-widget/widget/custom_edittext.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userName = TextEditingController();
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
        headerText(),
        Text(
          'User Name',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        CustomEdittext(
          hint: 'Enter your Name',
          type: TextFormFieldType.name,
          controller: userName,
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
      ],
    );
  }

  Widget headerText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SignUp',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Text(
          'SignUP To Continue Using App',
          style: TextStyle(fontSize: 20, color: Colors.blueGrey),
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Widget _button() {
    return Column(
      children: [
        CustomButton(text: 'SignUp', onPressed: () {}),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _accountRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Have an Account?", style: TextStyle(fontSize: 18)),
        SizedBox(width: 5),
        InkWell(
          onTap: (){
            GoRouter.of(context).pop();
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/custom-widget/widget/custom_button.dart';

import '../../../custom-widget/widget/custom_edittext.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final LoginCubit cubit;

  @override
  void initState() {
    cubit = LoginCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          bloc: cubit,
          builder: (BuildContext context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  _mainScreen(context),
                  SizedBox(height: 30),
                  _button(),
                  SizedBox(height: 20),
                  _accountRegister(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _mainScreen(context) {
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
          obscureText: false,
          //errorText: errorText,
          onChanged: (value) {
            // setState(() {
            //   errorText = value.isEmpty ? 'add password' : null;
            // });
          },
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
    final cubit = LoginCubit();
    return Column(
      children: [
        CustomButton(
          text: 'Login',
          onPressed: () async {
            await cubit.loginUser(context, emailController, passwordController);
          },
        ),
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

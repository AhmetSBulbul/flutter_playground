import 'package:flutter/material.dart';
import 'package:flutter_playground/simple_auth_ui/widgets/simple_auth_layout.dart';
import 'package:go_router/go_router.dart';

class SimpleAuthForgotPasswordScreen extends StatelessWidget {
  const SimpleAuthForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAuthLayout(
      title: 'Forgot Password?',
      subTitle:
          'Don\'t worry! It occurs. Please enter the email address linked with your account.',
      footerText: 'Remember Password?',
      footerAction: TextButton(
        child: Text('Login Now'),
        onPressed: () => context.go('/simple_auth/login'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your email',
            ),
          ),
          SizedBox(
            height: 28,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Send Code')),
        ],
      ),
    );
  }
}

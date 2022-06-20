import 'package:flutter/material.dart';
import 'package:flutter_playground/simple_auth_ui/widgets/divider_with_text.dart';
import 'package:flutter_playground/simple_auth_ui/widgets/simple_auth_layout.dart';
import 'package:flutter_playground/simple_auth_ui/widgets/social_icon_buttons.dart';
import 'package:go_router/go_router.dart';

class SimpleAuthRegisterScreen extends StatelessWidget {
  const SimpleAuthRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAuthLayout(
      title: 'Hello! Register to get started',
      footerText: 'Already have an account?',
      footerAction: TextButton(
        child: Text('Login Now'),
        onPressed: () => context.go('/simple_auth/login'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Register')),
          DividerWithText(text: 'Or Register With'),
          SocialIconButtons(),
        ],
      ),
    );
  }
}

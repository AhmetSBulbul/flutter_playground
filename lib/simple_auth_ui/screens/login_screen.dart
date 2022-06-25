import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/simple_auth_ui/widgets/divider_with_text.dart';
import 'package:flutter_playground/simple_auth_ui/widgets/simple_auth_layout.dart';
import 'package:flutter_playground/simple_auth_ui/widgets/social_icon_buttons.dart';
import 'package:go_router/go_router.dart';

class SimpleAuthLoginScreen extends StatelessWidget {
  const SimpleAuthLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAuthLayout(
      title: 'Welcome back! Glad to see you, Again!',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your username',
            ),
            // onChanged: context.read<LoginInfo>().onUserNameChanged,
          ),
          Spacer(),
          const TextField(
            decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility_off_outlined)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => context.go('/simple_auth/login/forgot_password'),
              child: Text(
                'Forgot Password?',
                style: context.textTheme.caption,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text(
              'Login',
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          DividerWithText(text: 'Or Login With'),
          const Spacer(
            flex: 2,
          ),
          SocialIconButtons(),
          Spacer(
            flex: 10,
          )
        ],
      ),
      footerText: 'Don’t have an account?',
      footerAction: TextButton(
          child: Text('Register Now'),
          onPressed: () => context.go('/simple_auth/register')),
    );
  }
}

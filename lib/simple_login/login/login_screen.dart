import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/simple_login/login/login_view_model.dart';
import 'package:flutter_playground/simple_login/widgets/login_footer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, this.verificationCode}) : super(key: key);
  final String? verificationCode;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.vertical),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.8,
                      child: Text(
                        'Welcome back! Glad to see you Again.',
                        style: context.textTheme.headlineLarge,
                      ),
                    ),
                    if (verificationCode != null)
                      Text('Referance Code: $verificationCode'),
                    const Spacer(
                      flex: 5,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Enter your username',
                      ),
                      onChanged: context.read<LoginInfo>().onUserNameChanged,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.visibility_off_outlined)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => context.go('/login/verification'),
                        child: Text(
                          'Forgot Password?',
                          style: context.textTheme.caption,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginInfo>().login();
                      },
                      child: const Text(
                        'Login',
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          'Or Login With',
                          style: context.textTheme.caption,
                        ),
                        Expanded(
                          child: Divider(
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: SvgPicture.asset(
                              R.svgImages.facebook_ic,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: SvgPicture.asset(
                              R.svgImages.google_ic,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: SvgPicture.asset(
                              R.svgImages.apple_ic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 10,
                    ),
                    const LoginScreenFooter(
                      text: 'Don\'t have an account?',
                      actionLabel: 'Register Now',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/simple_login/login_info.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(title: const Text('Login')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        letterSpacing: -0.3,
                        color: R.colors.dark),
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                  ),
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
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: R.colors.darkGray),
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginInfo>().login('test');
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
                        thickness: 2,
                        endIndent: 10,
                        color: R.colors.border,
                      ),
                    ),
                    Text(
                      'Or Login With',
                      style: TextStyle(
                          // fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: R.colors.darkGray),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        indent: 10,
                        color: R.colors.border,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: R.colors.darkGray),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: R.colors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

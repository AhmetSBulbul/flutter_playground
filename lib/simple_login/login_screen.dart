import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/custom_colors.dart';
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
                const SizedBox(
                  height: 40,
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
                const Spacer(),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                    // labelStyle: TextStyle(
                    //   color: R.colors.gray,
                    //   fontSize: 15,
                    //   fontWeight: FontWeight.w500,
                    // ),
                    // filled: true,
                    // fillColor: R.colors.lightGray,
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: R.colors.border, width: 2),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: R.colors.border, width: 2),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: R.colors.border, width: 2),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                  // style: ButtonStyle(
                  //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10))),
                  //   backgroundColor: MaterialStateProperty.all(R.colors.dark),
                  //   minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                  // ),
                  onPressed: () {
                    context.read<LoginInfo>().login('test');
                  },
                  child: const Text(
                    'Login',
                    // style: TextStyle(
                    //     fontSize: 15,
                    //     color: R.colors.white,
                    //     fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

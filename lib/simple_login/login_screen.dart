import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/simple_login/login_info.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<LoginInfo>().login('test');
                },
                child: const Text('Login'),
              ),
              Row(
                children: [
                  SvgPicture.asset(R.svgImages.facebook_ic),
                  SvgPicture.asset(R.svgImages.google_ic),
                ],
              )
            ],
          ),
        ),
      );
}

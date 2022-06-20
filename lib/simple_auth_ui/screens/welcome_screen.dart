import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:go_router/go_router.dart';

class SimpleAuthWelcomeScreen extends StatelessWidget {
  const SimpleAuthWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            R.images.simple_auth_bg,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Image.asset(
                        R.images.fruzz_digital_logo,
                      ),
                    ),
                    const SizedBox(
                      height: 46.0,
                    ),
                    ElevatedButton(
                      onPressed: () => context.go('/simple_auth/login'),
                      child: Text('Login'),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    OutlinedButton(
                      onPressed: () => context.go('/simple_auth/register'),
                      child: Text('Register'),
                      style: context.theme.outlinedButtonTheme.style?.copyWith(
                        foregroundColor:
                            MaterialStateProperty.all(R.colors.dark),
                        side: MaterialStateProperty.all(
                          BorderSide(color: R.colors.dark, width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 46.0,
                    ),
                    TextButton(
                        onPressed: () {}, child: Text('Continue as a guest'))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

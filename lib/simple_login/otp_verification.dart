import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/simple_login/widgets/digit_input.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('OTP Verification'),
          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'OTP Verification',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    letterSpacing: -0.3,
                    color: R.colors.dark),
              ),
              Text(
                'Enter the verification code we just sent on your email address.',
                style: TextStyle(fontSize: 16, color: R.colors.gray),
              ),
              const DigitInput(),
            ],
          ),
        ),
      ),
    );
  }
}

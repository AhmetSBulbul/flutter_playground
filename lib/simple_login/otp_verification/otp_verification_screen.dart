import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/simple_login/otp_verification/otp_verification_view_model.dart';
import 'package:flutter_playground/simple_login/widgets/digit_input.dart';
import 'package:flutter_playground/simple_login/widgets/login_footer.dart';

import 'package:provider/provider.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ChangeNotifierProvider<OTPVerificationViewModel>(
            create: (_) => OTPVerificationViewModel(),
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Text(
                  'OTP Verification',
                  textAlign: TextAlign.start,
                  style: context.textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Enter the verification code we just sent on your email address.',
                ),
                const Spacer(),
                DigitInput(
                    onCodeEditingComplete: context
                        .watch<OTPVerificationViewModel>()
                        .onVerificationCodeSubmitted),
                const Spacer(),
                ElevatedButton(
                    onPressed: () => context
                        .read<OTPVerificationViewModel>()
                        .verify(context),
                    child: const Text('Verify')),
                const Spacer(
                  flex: 10,
                ),
                const LoginScreenFooter(
                    actionLabel: 'Resend', text: 'Didn\'t receive code?'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

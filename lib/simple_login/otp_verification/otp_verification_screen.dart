import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/simple_login/otp_verification/otp_verification_view_model.dart';
import 'package:flutter_playground/simple_login/widgets/digit_input.dart';
import 'package:flutter_playground/simple_login/widgets/login_footer.dart';
// import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);
  // final verificationInfo = OTPVerificationViewModel();

  // void onVerify(BuildContext context, String val) {
  //   context.go('/login?code=$val');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ChangeNotifierProvider<OTPVerificationViewModel>(
            create: (_) => OTPVerificationViewModel(),
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Text(
                  'OTP Verification',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      letterSpacing: -0.3,
                      color: R.colors.dark),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Enter the verification code we just sent on your email address.',
                  style: TextStyle(fontSize: 16, color: R.colors.gray),
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

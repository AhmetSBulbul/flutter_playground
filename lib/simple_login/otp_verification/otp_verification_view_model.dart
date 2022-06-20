import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OTPVerificationViewModel extends ChangeNotifier {
  // final BuildContext _context;
  var _verificationCode = '';

  // OTPVerificationViewModel(this._context);

  String get verificationCode => _verificationCode;
  bool get isCodeValid => _verificationCode.length == 4;

  void onVerificationCodeSubmitted(String value) {
    _verificationCode = value;
    notifyListeners();
  }

  void verify(BuildContext context) {
    if (isCodeValid) {
      context.go('/login?code=$_verificationCode');
    }
  }
}

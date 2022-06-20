import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/r.dart';

class LoginScreenFooter extends StatelessWidget {
  const LoginScreenFooter(
      {Key? key,
      required this.actionLabel,
      required this.text,
      this.onActionPressed})
      : super(key: key);
  final VoidCallback? onActionPressed;
  final String text;
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style:
              TextStyle(fontWeight: FontWeight.w600, color: R.colors.darkGray),
        ),
        TextButton(
          onPressed: onActionPressed ?? () {},
          child: Text(
            actionLabel,
            style:
                TextStyle(fontWeight: FontWeight.w600, color: R.colors.primary),
          ),
        ),
      ],
    );
  }
}

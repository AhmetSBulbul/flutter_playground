import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 10,
          ),
        ),
        Text(
          text,
          style: context.textTheme.caption,
        ),
        Expanded(
          child: Divider(
            indent: 10,
          ),
        ),
      ],
    );
  }
}

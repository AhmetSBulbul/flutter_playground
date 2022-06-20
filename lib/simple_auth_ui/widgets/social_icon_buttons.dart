import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIconButtons extends StatelessWidget {
  const SocialIconButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}

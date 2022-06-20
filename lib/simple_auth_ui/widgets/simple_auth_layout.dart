import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
// import 'package:go_router/go_router.dart';

class SimpleAuthLayout extends StatelessWidget {
  const SimpleAuthLayout(
      {Key? key,
      this.title,
      this.subTitle,
      required this.child,
      this.footerText,
      this.footerAction})
      : super(key: key);

  final String? title;
  final String? subTitle;
  final Widget child;
  final String? footerText;
  final TextButton? footerAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.vertical),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 34,
                ),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.8,
                  child: Text(
                    title ?? 'Simple Auth Layout Title',
                    style: context.textTheme.headlineLarge,
                  ),
                ),
                if (subTitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      subTitle!,
                      style: context.textTheme.caption,
                    ),
                  ),
                SizedBox(
                  height: 28,
                ),
                Expanded(child: child),
                if (footerText != null || footerAction != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        footerText ?? '',
                        style: context.textTheme.caption,
                      ),
                      footerAction ?? SizedBox()
                    ],
                  ),
                SizedBox(
                  height: 48,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

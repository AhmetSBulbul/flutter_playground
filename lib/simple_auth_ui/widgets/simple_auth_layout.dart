import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
// import 'package:go_router/go_router.dart';

class SimpleAuthLayout extends StatelessWidget {
  const SimpleAuthLayout(
      {Key? key,
      this.title,
      required this.child,
      this.footerText,
      this.footerAction})
      : super(key: key);

  final String? title;
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 34.0),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.8,
                    child: Text(
                      title ?? 'Simple Auth Layout Title',
                      style: context.textTheme.headlineLarge,
                    ),
                  ),
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

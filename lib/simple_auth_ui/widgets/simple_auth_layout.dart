import 'package:flutter/material.dart';

class SimpleAuthLayout extends StatelessWidget {
  const SimpleAuthLayout({Key? key, this.fromloc}) : super(key: key);
  final String? fromloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SimpleAuthLayout'),
      ),
    );
  }
}

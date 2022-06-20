import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/simple_login/login_info.dart';
import 'package:flutter_playground/simple_login/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final loginInfo = LoginInfo();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginInfo>.value(
      value: loginInfo,
      child: MaterialApp.router(
          theme: ThemeData(
            useMaterial3: true,
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: R.colors.border,
                    width: 1,
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  const Size(50, 50),
                ),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(
                  R.colors.white,
                ),
                backgroundColor: MaterialStateProperty.all(R.colors.dark),
                minimumSize: MaterialStateProperty.all(
                  const Size(200, 50),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: R.colors.gray,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: R.colors.lightGray,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.border, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.border, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.border, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            fontFamily: 'Urbanist',
          ),
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate),
    );
  }

  late final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    ],
    redirect: (state) {
      final bool loggedIn = loginInfo.isLoggedIn;
      final bool loggingIn = state.subloc == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      if (loggingIn) return '/';

      return null;
    },
    refreshListenable: loginInfo,
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.read<LoginInfo>().userName),
      ),
    );
  }
}

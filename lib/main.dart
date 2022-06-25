import 'package:flutter/material.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/home/home_screen.dart';
import 'package:flutter_playground/injection.dart';
import 'package:flutter_playground/movie_wiki/data/local/models/movie_detailed_local_model/movie_local_model.dart';
import 'package:flutter_playground/movie_wiki/data/local/models/movie_thumbnail_local_model/movie_thumbnail_local_model.dart';
import 'package:flutter_playground/movie_wiki/screens/movie_wiki_app.dart';
import 'package:flutter_playground/movie_wiki/screens/movie_wiki_onboard.dart';
import 'package:flutter_playground/movie_wiki/screens/omdb_view.dart';
import 'package:flutter_playground/simple_auth_ui/screens/forgot_password_screen.dart';
import 'package:flutter_playground/simple_auth_ui/screens/login_screen.dart';
import 'package:flutter_playground/simple_auth_ui/screens/register_screen.dart';
import 'package:flutter_playground/simple_auth_ui/screens/welcome_screen.dart';
import 'package:flutter_playground/simple_login/login/login_view_model.dart';
import 'package:flutter_playground/simple_login/login/login_screen.dart';
import 'package:flutter_playground/simple_login/otp_verification/otp_verification_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieLocalModelAdapter());
  Hive.registerAdapter(MovieThumbnailLocalModelAdapter());

  await Hive.openBox('movies');
  await Hive.openBox('thumbnails');
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
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            textTheme: TextTheme(
              headlineLarge: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                color: R.colors.dark,
              ),
              bodyText2: TextStyle(fontSize: 16, color: R.colors.gray),
              caption: TextStyle(
                fontWeight: FontWeight.w600,
                color: R.colors.darkGray,
                fontSize: 15,
              ),
            ),
            dividerColor: R.colors.border,
            dividerTheme:
                DividerThemeData(color: R.colors.border, thickness: 2),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: R.colors.dark),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: R.colors.border,
                    width: 1,
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  const Size(56, 56),
                ),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(
                  R.colors.white,
                ),
                backgroundColor: MaterialStateProperty.all(R.colors.dark),
                minimumSize: MaterialStateProperty.all(
                  const Size(200, 56),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 15,
                    // decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(R.colors.primary),
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
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/omdb', builder: (context, state) => const OmdbView()),
      GoRoute(
        path: '/movie_wiki_onboard',
        builder: (context, state) => const MovieWikiOnboard(),
      ),
      GoRoute(
        path: '/movie_wiki_app',
        redirect: (state) =>
            state.subloc == '/movie_wiki_app/0' ? '/' : '/movie_wiki_app/0',
      ),
      GoRoute(
        path: '/movie_wiki_app/:pid',
        builder: (context, state) {
          final page_id = state.params['pid'] ?? '0';
          final page_state = MovieWikiAppPage.fromPid(page_id);
          return MovieWikiAppScreen(
              key: state.pageKey, currentPage: page_state);
        },
      ),
      GoRoute(
        path: '/simple_auth',
        builder: (context, state) => const SimpleAuthWelcomeScreen(),
        routes: [
          GoRoute(
              path: 'login',
              builder: (context, state) => SimpleAuthLoginScreen(),
              routes: [
                GoRoute(
                  path: 'forgot_password',
                  builder: (context, state) =>
                      const SimpleAuthForgotPasswordScreen(),
                )
              ]),
          GoRoute(
            path: 'register',
            builder: (context, state) => SimpleAuthRegisterScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          final query = state.queryParams['code'];
          return LoginScreen(
            verificationCode: query,
          );
        },
        routes: [
          GoRoute(
              path: 'verification',
              builder: (context, state) => OTPVerificationScreen()),
        ],
      ),
    ],
    redirect: (state) {
      print('current: ' + state.location);
      print('subloc: ' + state.subloc);
      print('pageKey: ' + state.pageKey.toString());
    },
    // show the current router location as the user navigates page to page; note
    // that this is not required for nested navigation but it is useful to show
    // the location as it changes
    // navigatorBuilder: (context, state, child) => Material(
    //   child: Column(
    //     children: [
    //       Expanded(child: child),
    //       Padding(
    //         padding: const EdgeInsets.all(8),
    //         child: Text(state.location),
    //       ),
    //     ],
    //   ),
    // ),

    // redirect: (state) {
    //   final bool loggedIn = loginInfo.isLoggedIn;
    //   final bool loggingIn = state.subloc.startsWith('/login');
    //   if (!loggedIn) return loggingIn ? null : '/login';

    //   if (loggingIn) return '/';

    //   return null;
    // },
    // refreshListenable: loginInfo,
    debugLogDiagnostics: true,
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

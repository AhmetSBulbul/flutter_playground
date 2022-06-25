import 'dart:ui';

class CustomColors {
  final Color primary;
  final Color dark;
  final Color border;
  final Color darkGray;
  final Color gray;
  final Color lightGray;
  final Color white;
  final Color black;
  final Color movieRed;
  final Color movieBlack;
  final Color movieGray;

  const CustomColors()
      : primary = const Color(0xFF35C2C1),
        dark = const Color(0xFF1E232C),
        border = const Color(0xFFE8ECF4),
        darkGray = const Color(0xFF6A707C),
        gray = const Color(0xFF8391A1),
        lightGray = const Color(0xFFF7F8F9),
        white = const Color(0xFFFFFFFF),
        movieRed = const Color(0xFFE21221),
        movieBlack = const Color(0xFF181A20),
        movieGray = const Color(0xFF757575),
        black = const Color(0xFF000000);
}

// enum EnhancedCustomColors {
//   white(Color(0xFFFFFFFF)),
//   dark(Color(0xFF000000));

//   const EnhancedCustomColors(this.color);
//   final Color color;
// }

part of '../index.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.text),
    ),

    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.background,
      contentTextStyle: TextStyle(color: AppColors.text),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondary,
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),

    extensions: <ThemeExtension<dynamic>>[
      BoxDecorationTheme(
        card: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ],
  );
}

class BoxDecorationTheme extends ThemeExtension<BoxDecorationTheme> {
  const BoxDecorationTheme({required this.card});

  final BoxDecoration card;

  @override
  BoxDecorationTheme copyWith({BoxDecoration? card}) {
    return BoxDecorationTheme(card: card ?? this.card);
  }

  @override
  BoxDecorationTheme lerp(BoxDecorationTheme? other, double t) {
    return this;
  }
}

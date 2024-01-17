import 'package:flutter/material.dart';
import 'package:mementoapp/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BonsaiVerse',
      initialRoute: '/',
      theme: ThemeData(
        //primaryColorLight: Color(0xff293A23),
        hintColor: Color(0xff293A23),
        primaryColor: Color(0xff507583),
        textTheme: TextTheme(
          labelLarge: TextStyle( fontSize: 18)
        ),
        //buttonTheme: ButtonThemeData(buttonColor: Color(0xff293A23)),
        colorScheme: const MyAppColorScheme(),
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,
    );
  }
}

class MyAppColorScheme extends ColorScheme {
  // Define your custom colors here
  static const Color primaryColor = Color(0xff507583);
  static const Color alternate = Color(0xff1c262e);
  static const Color secondaryColor = Color(0xFF18aa99);
  static const Color tertiaryColor = Color(0xFF928163);
  static const Color backgroundPrimary = Color(0xFF182026);
  static const Color backgroundSecondary = Color(0xFF101518);
  static const Color onBackgroundColor = Color(0xFF000000);
  static const Color errorColor = Color(0xFFc4454d);

  // Override the constructor
  const MyAppColorScheme({
    // Set your custom colors as primary and secondary
    Color primary = primaryColor,
    Color onPrimary = alternate,
    Color secondary = secondaryColor,
    Color tertiary = tertiaryColor,
    Color background = backgroundPrimary,
    Color backsgroundSec = backgroundSecondary,
    Color alternate = alternate,
    Color error = errorColor

    // Include other color properties from the super class
    // such as background, surface, onBackground, etc.

  }) : super(
          primary: primary, onPrimary: onPrimary,
          secondary: secondary, onSecondary: onPrimary,
          tertiary: tertiary,
          background: background, onBackground: onBackgroundColor,
          error: error , onError: background,
          surface: background, onSurface: backsgroundSec,
          brightness: Brightness.light
      );
}
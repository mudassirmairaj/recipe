import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/data/dummy_data.dart';
import 'package:recipe_app/screens/categories.dart';
import 'package:recipe_app/screens/recipe.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.karlaTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const CategoriesScreen());
  }
}

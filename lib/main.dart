import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'pages/home_page.dart';

/// Application entry point.
///
/// Initializes the Flutter app with custom theme and routing.
void main() {
  runApp(const MyGameApp());
}

/// Root widget of the application.
///
/// Configures MaterialApp with custom themes following the design system
/// defined in .copilot-instructions.json.
class MyGameApp extends StatelessWidget {
  const MyGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobil Oyun Haberleri',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

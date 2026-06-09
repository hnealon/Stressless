import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const StressLessApp());
}

class StressLessApp extends StatelessWidget {
  const StressLessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StressLess',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const MainScreen(),
    );
  }
}

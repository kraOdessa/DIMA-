import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(JavaQuizApp());
}

class JavaQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Java Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,

        // Define default text themes with updated style names
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey[700]),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),

        // Define the default button theme with updated parameter names
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent, // Updated from 'primary' to 'backgroundColor'
            foregroundColor: Colors.white, // Updated from 'onPrimary' to 'foregroundColor'
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        // Define the default progress indicator color
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.blueAccent,
          linearTrackColor: Colors.grey[300],
        ),
      ),
      home: HomeScreen(),
    );
  }
}




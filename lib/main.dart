import 'package:flutter/material.dart';
import "./screens/auth/login.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitFind',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hamin/features/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamin',
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: DashboardScreen()
    );
  }
}
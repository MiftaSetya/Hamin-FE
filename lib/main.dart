import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamin/features/dashboard/screens/dashboard_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp()
    )
  );
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
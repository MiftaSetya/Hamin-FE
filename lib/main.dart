import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamin/features/dashboard/models/task_model.dart';
import 'package:hamin/features/dashboard/screens/dashboard_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<TaskModel>('tasks');

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
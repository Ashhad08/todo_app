import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'frontend/screens/create_task.dart';
import 'frontend/screens/start_with_bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateTaskView(),
    );
  }
}

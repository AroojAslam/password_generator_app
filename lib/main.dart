import 'package:flutter/material.dart';
import 'auth_screen/login.dart';
import 'onboarding_screen/intro_screens.dart';

void main()async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(005050, 00, 80, 80)),
        useMaterial3: true,
      ),
      home:  OnboardScreen(),
    );
  }
}


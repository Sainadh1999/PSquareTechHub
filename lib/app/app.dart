import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'P Square Tech Hub',
      home: HomeScreen(), // ✅ no const
    );
  }
}

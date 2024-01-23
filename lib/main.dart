import 'package:flutter/material.dart';
import 'package:news_nook/views/news_details.dart';
import 'package:news_nook/views/news_home.dart';
import 'package:news_nook/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/home': (context) => NewsHome(),
        '/splash': (context) => const SpalshScreen(),
      },
    );
  }
}

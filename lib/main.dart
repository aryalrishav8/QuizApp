import 'package:flutter/material.dart';
import 'package:quizapp/mainhome.dart';
import 'homescreen.dart';
import 'quiz.dart';
import 'lastscreen.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/home': (context) => const MyHome(),
        '/quiz': (context) => const QuizScreen(),
        '/final': (context) => const LastScreen(),
        '/mainhome': (context) => const HomeScreen(),
      },
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

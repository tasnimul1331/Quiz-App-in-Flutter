import 'package:flutter/material.dart';
import 'package:quiz_app/data/dummy_question.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question.dart';

import 'package:quiz_app/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  final List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void ChooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == question.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget startScreen = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      startScreen = QuestionScreen(ChooseAnswer);
    } else if (activeScreen == 'result-screen') {
      startScreen = ResultScreen(switchScreen, selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 41, 22, 73),
                const Color.fromARGB(255, 120, 161, 231),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: startScreen,
        ),
      ),
    );
  }
}

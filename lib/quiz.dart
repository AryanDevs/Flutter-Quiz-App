import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   activeScreen = StartScreen(switchScreens);
  //   super.initState();
  // }

  final screenMap = {
    1: 'start-screen',
    2: 'questions-screen',
    3: 'results-screen'
  };

  var activeScreen = 'start-screen';
  void switchScreens(int x) {
    setState(() {
      activeScreen = screenMap[x] ?? 'start-screen';
      if (activeScreen == 'start-screen') {
        answers = [];
      }
    });
  }

  List<String> answers = [];

  void chooseAnswer(String ans) {
    answers.add(ans);
    if (answers.length == questions.length) {
      // answers = [];
    }
  }

  Widget build(context) {
    var finalScreener = {
      'start-screen': StartScreen(switchScreens),
      'questions-screen': QuestionsScreen(switchScreens, chooseAnswer),
      'results-screen': ResultScreen(
        switchScreens,
        chosenAnswers: answers,
      )
    };
    Widget finalScreen =
        finalScreener[activeScreen] ?? StartScreen(switchScreens);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 141, 28, 190),
              const Color.fromARGB(255, 181, 75, 200)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: finalScreen,
        ),
      ),
    );
  }
}

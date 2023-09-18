import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final void Function(int) switchScreens;
  final List<String> chosenAnswers;

  const ResultScreen(this.switchScreens,
      {required this.chosenAnswers, super.key});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    List<String> correct_answers = [];
    for (int i = 0; i < questions.length; i++) {
      correct_answers.add(questions[i].answers[0]);
    }

    var score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (correct_answers[i] == chosenAnswers[i]) {
        score++;
      }
    }

    final total = chosenAnswers.length;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You scored $score out of $total',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummry(getSummaryData()),
          const SizedBox(
            height: 50,
          ),
          TextButton.icon(
              onPressed: () {
                switchScreens(1);
              },
              icon: const Icon(Icons.restart_alt),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.roboto(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

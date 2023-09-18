import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.selectFunction, {super.key});

  final String answerText;
  final void Function() selectFunction;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: selectFunction,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 46, 2, 102),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}

import 'package:flutter/material.dart';

class QuestionsSummry extends StatelessWidget {
  const QuestionsSummry(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return (Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['correct_answer'] == data['user_answer']
                            ? Colors.blue
                            : Colors.pink[200]),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(color: Colors.pink[200]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                )
              ],
            ));
          }).toList(),
        ),
      ),
    );
  }
}

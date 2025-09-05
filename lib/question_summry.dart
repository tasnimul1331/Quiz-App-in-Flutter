import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  var CorColor;

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map((data) {
        if (data['user_answer'] == data['correct_answer']) {
          CorColor = Colors.cyanAccent;
        } else {
          CorColor = const Color.fromARGB(255, 251, 23, 23);
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30, // fixed width
              height: 30, // fixed height
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 20, left: 5),
              decoration: BoxDecoration(
                color: CorColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                ((data['question_index'] as int) + 1).toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['question'] as String,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    data['user_answer'] as String,
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                  Text(
                    data['correct_answer'] as String,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 80, 198, 249),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

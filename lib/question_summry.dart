import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30, // fixed width
              height: 30, // fixed height
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 20, left: 5),
              decoration: BoxDecoration(
                color: (data['user_answer'] == data['correct_answer'])
                    ? Colors.cyanAccent
                    : Colors.red,
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

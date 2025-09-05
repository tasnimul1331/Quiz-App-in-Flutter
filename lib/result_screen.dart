import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/data/dummy_question.dart';
import 'package:quiz_app/question_summry.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.switchScreen, this.selectedAnswers, {super.key});

  final void Function() switchScreen;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': question[i].text,
        'correct_answer': question[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = question.length;
    final correctAnswers = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You answered $correctAnswers out of $totalQuestions questions correctly!',
              style: const TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            SizedBox(
              height: 100,
              child: SingleChildScrollView(child: QuestionSummary(summaryData)),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                switchScreen();
                selectedAnswers.clear();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

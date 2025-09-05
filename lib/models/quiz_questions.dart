class QuizQuestions {
  const QuizQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> shuffledAnswers() {
    final shuffled = List<String>.from(answers);
    shuffled.shuffle();
    return shuffled;
  }
}

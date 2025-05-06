class HijaiyahQuestion {
  final String text;
  final String word;
  final String correctAnswer;
  final List<String> options;

  HijaiyahQuestion({
    required this.text,
    required this.word,
    required this.correctAnswer,
    required this.options,
  });
}

class SusunHurufQuestion {
  final String question;
  final List<String> fragments;
  final String answer;

  SusunHurufQuestion({
    required this.question,
    required this.fragments,
    required this.answer,
  });
}

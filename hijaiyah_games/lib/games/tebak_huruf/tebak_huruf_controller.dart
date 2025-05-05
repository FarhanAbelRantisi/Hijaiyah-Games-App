import 'package:flutter/material.dart';
import '../../../models/question_model.dart';
import '../../../data/tebak_huruf_questions.dart';

class TebakHurufController extends ChangeNotifier {
  int currentIndex = 0;
  int score = 0;
  int correctAnswers = 0;
  bool isFinished = false;
  String? selectedAnswer;

  List<HijaiyahQuestion> get questions => tebakHurufQuestions;
  HijaiyahQuestion get currentQuestion => questions[currentIndex];

  bool get isAnswered => selectedAnswer != null;

  void answer(String selected) {
    selectedAnswer = selected;

    if (selected == currentQuestion.correctAnswer) {
      score += 10;
      correctAnswers++; // Tambahkan ini
    }

    notifyListeners();
  }

  void reset() {
    currentIndex = 0;
    score = 0;
    correctAnswers = 0; // Reset jumlah jawaban benar
    isFinished = false;
    selectedAnswer = null;
    notifyListeners();
  }
}


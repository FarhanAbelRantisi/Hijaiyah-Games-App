import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../data/susun_huruf_questions.dart';

class SusunHurufViewmodel extends ChangeNotifier {
  final List<HijaiyahQuestion> _questions = susunHurufQuestions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int correctAnswers = 0;
  List<String> _userAnswer = [];
  List<int> _usedIndices = [];
  bool _isCorrect = false;
  List<bool> _letterCorrectness = [];

  VoidCallback? onGameFinished;

  List<HijaiyahQuestion> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  List<String> get userAnswer => _userAnswer;
  List<int> get usedIndices => _usedIndices;
  List<bool> get letterCorrectness => _letterCorrectness;
  HijaiyahQuestion get currentQuestion => _questions[_currentQuestionIndex];
  bool get isCorrect => _isCorrect;
  bool get isAnswerComplete => _userAnswer.length == currentQuestion.correctAnswer.length;
  bool get isCurrentAnswerCorrect =>
    userAnswer.join('') == currentQuestion.correctAnswer;


  void addLetter(String letter, int index) {
    if (_userAnswer.length < currentQuestion.correctAnswer.length &&
        !_usedIndices.contains(index)) {
      _userAnswer.add(letter);
      _usedIndices.add(index);
      checkAnswer();
      notifyListeners();
    }
  }

  void removeLastLetter() {
    if (!isAnswerComplete && _userAnswer.isNotEmpty) {
      _userAnswer.removeLast();
      _usedIndices.removeLast();
      checkAnswer();
      notifyListeners();
    }
  }

  void removeLetterAtIndex(int answerIndex) {
    if (!isAnswerComplete &&
        answerIndex >= 0 &&
        answerIndex < _userAnswer.length) {
      _userAnswer.removeAt(answerIndex);
      _usedIndices.removeAt(answerIndex);
      checkAnswer();
      notifyListeners();
    }
  }

  void checkAnswer() {
    String answer = _userAnswer.join();

    _letterCorrectness = List.generate(currentQuestion.correctAnswer.length, (i) {
      if (i >= _userAnswer.length) return false;
      return _userAnswer[i] == currentQuestion.correctAnswer[i];
    });

    bool wasCorrectBefore = _isCorrect;
    _isCorrect = (answer == currentQuestion.correctAnswer);

    // Tambahkan ke correctAnswers hanya saat baru pertama kali benar
    if (_isCorrect && !wasCorrectBefore) {
      correctAnswers++;
      _score += 10;
    }

    notifyListeners();
  }

  void nextQuestion() {
    _userAnswer.clear();
    _usedIndices.clear();
    _isCorrect = false;
    _letterCorrectness.clear();
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    } else {
      onGameFinished?.call();
    }
  }

  void resetGame() {
    _currentQuestionIndex = 0;
    _score = 0;
    _userAnswer.clear();
    _usedIndices.clear();
    _isCorrect = false;
    _letterCorrectness.clear();
    notifyListeners();
  }

  void setOnGameFinished(VoidCallback callback) {
    onGameFinished = callback;
  }
}

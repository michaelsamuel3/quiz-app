import 'package:flutter/material.dart';
import 'package:quizapp/utility/db.dart';

class QuestionProvider extends ChangeNotifier {
  final List<Question> _questions = getQuestions();

  List<Question> get questions => _questions;

  void addQuestion(Question question) {
    _questions.add(question);
    notifyListeners();
  }

  void deleteQuestion(int index) {
    _questions.removeAt(index);
    notifyListeners();
  }
}

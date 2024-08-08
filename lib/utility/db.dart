

// db.dart

//import 'package:quizapp/models/question.dart';

// Simulate a database with an in-memory list
List<Question> _questions = [];

Future<List<Question>> getQuestionsFromDatabase() async {
  return _questions;
}

Future<void> saveQuestionToDatabase(Question question) async {
  _questions.add(question);
}

Future<void> deleteQuestionFromDatabase(int index) async {
  _questions.removeAt(index);
}


class Answer {
  String answerText;
  bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

class Question {
  String questionText;
  List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

List<Question> getQuestions() {
  return [
    Question("What is the Capital of India?", [
      Answer("New Delhi", true),
      Answer("Mumbai", false),
      Answer("Kolkata", false),
      Answer("Chennai", false),
    ]),
    Question("Who wrote the play 'Romeo and Juliet'?", [
      Answer("William Shakespeare", true),
      Answer("Charles Dickens", false),
      Answer("J.K. Rowling", false),
      Answer("Jane Austen", false),
    ]),
      Question(" Which country is known as 'Land of rising sun '?", [
      Answer("China", false),
      Answer("Korea", false),
      Answer("Vietnam", false),
      Answer("Japan", true),]),
 Question(" Which is the largest mammel in  earth ?", [
      Answer("Blue whale", true),
      Answer("Hippo pottamus", false),
      Answer("Elephant", false),
      Answer("Girraffe", false),
    ]),
 Question(" what is the smallest unit of matter ?", [
      Answer("Cell", false),
      Answer("Molecule", false),
      Answer("Compound", false),
      Answer("Atom", true),
    ]),
     Question(" Which planet is kmown as Red Planet ?", [
      Answer("Venus", false),
      Answer("Mars", true),
      Answer("Jupiter", false),
      Answer("Saturn", false),
    ]),
     Question(" who painted Mona lisa ?", [
      Answer("Vincent van Gogh", false),
      Answer("Pablo Picasso", false),
      Answer("Leonardo da Vinci", true),
      Answer("Michaelangelo", false),
    ]),
     Question(" what is the largest ocean in the world ?", [
      Answer("Atlantic Ocean", false),
      Answer("Indian Ocean", false),
      Answer("Artic Ocean", false),
      Answer("pacific Ocean", true),
    ]),
      Question(" Who is the author of 'Harry Potter book series' ?", [
      Answer("J R R Tolkien", false),
      Answer("J K Rowling", true),
      Answer("George R R Martin", false),
      Answer("Dan Brown", false),
    ]),
    Question(" which continent is most populus ?", [
      Answer("Asia", true),
      Answer("Africa", false),
      Answer("Europe", false),
      Answer("North America", false),
    ]),
  ];
}

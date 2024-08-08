import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/utility/class.dart';
import 'package:quizapp/utility/db.dart';

import 'package:quizapp/utility/routes.dart';

class Adminscreen extends StatefulWidget {
  const Adminscreen({super.key});

  @override
  State<Adminscreen> createState() => _AdminscreenState();
}

class _AdminscreenState extends State<Adminscreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController1 = TextEditingController();
  final TextEditingController _answerController2 = TextEditingController();
  final TextEditingController _answerController3 = TextEditingController();
  final TextEditingController _answerController4 = TextEditingController();

  void _addQuestion() {
    final newQuestion = Question(
      _questionController.text,
      [
        Answer(_answerController1.text, false),
        Answer(_answerController2.text, false),
        Answer(_answerController3.text, false),
        Answer(_answerController4.text, false),
      ],
    );

    Provider.of<QuestionProvider>(context, listen: false).addQuestion(newQuestion);

    _questionController.clear();
    _answerController1.clear();
    _answerController2.clear();
    _answerController3.clear();
    _answerController4.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black87,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.home);
              },
              child: const Text('Back to Home'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Question',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _answerController1,
              decoration: const InputDecoration(
                labelText: 'Answer 1',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _answerController2,
              decoration: const InputDecoration(
                labelText: 'Answer 2',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _answerController3,
              decoration: const InputDecoration(
                labelText: 'Answer 3',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _answerController4,
              decoration: const InputDecoration(
                labelText: 'Answer 4',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addQuestion,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text('Add Question',style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20),
            Consumer<QuestionProvider>(
              builder: (context, questionProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questionProvider.questions.length,
                  itemBuilder: (context, index) {
                    final question = questionProvider.questions[index];
                    return Card(
                      color: Colors.grey[850],
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.questionText,
                              style: const TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            for (var answer in question.answerList)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  answer.answerText,
                                  style: const TextStyle(fontSize: 16, color: Colors.white),
                                ),
                              ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  questionProvider.deleteQuestion(index);
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                                child: const Text('Delete Question',style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

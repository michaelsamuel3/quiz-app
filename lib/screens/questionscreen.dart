// // ignore_for_file: camel_case_types, deprecated_member_use, sort_child_properties_last, non_constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:quizapp/utility/db.dart';

// class Questions_screen extends StatefulWidget {
//   const Questions_screen({super.key});

//   @override
//   State<Questions_screen> createState() => _Questions_screenState();
// }

// class _Questions_screenState extends State<Questions_screen> {
//   List<Question> questionlist = getQuestions();
//   int currentQuestionIndex = 0;
//   int score = 0;
//   Answer? selectedAnswer;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//          color:Colors.black87,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 60),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Text(
//                   //   "Question : ${currentQuestionIndex + 1}/${questionlist.length}",
//                   //   style: TextStyle(
//                   //       fontSize: 35,
//                   //       color: Colors.white,
//                   //       fontWeight: FontWeight.w500,
//                   //      // fontStyle: FontStyle.italic,
//                   //       decoration: TextDecoration.underline,
//                   //       shadows: const [
//                   //         Shadow(
//                   //             blurRadius: 10,
//                   //             color: Colors.redAccent,
//                   //             offset: Offset(3, 3))
//                   //       ]),
//                   // ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.04,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     height: MediaQuery.of(context).size.height * 0.15,
//                     padding: const EdgeInsets.all(10),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 230, 154, 154),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Text(
//                       questionlist[currentQuestionIndex].questionText,
//                       style: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.05,
//                   ),
//                   answerList(),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.15,
//                   ),
//                   nextButton(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget answerList() {
//     return Column(
//       children: questionlist[currentQuestionIndex]
//           .answerList
//           .map((e) => answerButton(e))
//           .toList(),
//     );
//   }

//   Widget answerButton(Answer answer) {
//     bool isSelected = answer == selectedAnswer;

//     return Container(
//       width: MediaQuery.of(context).size.width * 0.9,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       height: MediaQuery.of(context).size.height * 0.06,
//       child: ElevatedButton(
//         child: Text(
//           answer.answerText,
//           style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//         ),
//         style: ElevatedButton.styleFrom(
//           foregroundColor: isSelected ? Colors.white : Colors.black,
//           backgroundColor: isSelected
//               ? Color.fromARGB(189, 168, 135, 70)
//               : Colors.white70,
//           shape: const StadiumBorder(),
//         ),
//         onPressed: () {
//           setState(() {
//             if (selectedAnswer == answer) {
//               // Deselect the answer
//               selectedAnswer = null;
//               if (answer.isCorrect) {
//                 score--;
//               }
//             } else {
//               // Select the new answer
//               if (selectedAnswer != null && selectedAnswer!.isCorrect) {
//                 score--;
//               }
//               selectedAnswer = answer;
//               if (answer.isCorrect) {
//                 score++;
//               }
//             }
//           });
//         },
//       ),
//     );
//   }

//   Widget nextButton() {
//     bool isLastQuestion = currentQuestionIndex == questionlist.length - 1;

//     return SizedBox(
//       width: MediaQuery.of(context).size.height * 0.30,
//       height: 48,
//       child: ElevatedButton(
//         child: Text(
//           isLastQuestion ? "Submit" : "Next",
//           style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//         ),
//         style: ElevatedButton.styleFrom(
//           foregroundColor: Color.fromARGB(255, 34, 1, 1),
//           backgroundColor: Color.fromARGB(255, 238, 15, 15),
//           shape: const StadiumBorder(),
//         ),
//         onPressed: () {
//           if (isLastQuestion) {
//             showDialog(context: context, builder: (_) => showScore());
//           } else {
//             setState(() {
//               currentQuestionIndex++;
//               selectedAnswer = null;
//             });
//           }
//         },
//       ),
//     );
//   }

//   AlertDialog showScore() {
//     bool isPassed = score >= questionlist.length * 0.3;
//     String title = isPassed ? "Passed" : "Failed";

//     return AlertDialog(
//       title: Text(
//         "$title \n \nScore: $score",
//         style: TextStyle(
//             color: isPassed ? Colors.green : Colors.red,
//             fontWeight: FontWeight.bold,
//             fontSize: 20),
//       ),
//       content: ElevatedButton(
//         child: const Text(
//           "Restart",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         onPressed: () {
//           Navigator.pop(context);
//           setState(() {
//             currentQuestionIndex = 0;
//             score = 0;
//             selectedAnswer = null;
//           });
//         },
//       ),
//     );
//   }
// }


// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/utility/class.dart';

import 'package:quizapp/utility/db.dart';

class Questions_screen extends StatefulWidget {
  const Questions_screen({super.key});

  @override
  State<Questions_screen> createState() => _Questions_screenState();
}

class _Questions_screenState extends State<Questions_screen> {
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final questionlist = Provider.of<QuestionProvider>(context).questions;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 154, 154),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      questionlist[currentQuestionIndex].questionText,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  answerList(questionlist),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  nextButton(questionlist),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget answerList(List<Question> questionlist) {
    return Column(
      children: questionlist[currentQuestionIndex]
          .answerList
          .map((e) => answerButton(e))
          .toList(),
    );
  }

  Widget answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected
              ? const Color.fromARGB(189, 168, 135, 70)
              : Colors.white70,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          setState(() {
            if (selectedAnswer == answer) {
              // Deselect the answer
              selectedAnswer = null;
              if (answer.isCorrect) {
                score--;
              }
            } else {
              // Select the new answer
              if (selectedAnswer != null && selectedAnswer!.isCorrect) {
                score--;
              }
              selectedAnswer = answer;
              if (answer.isCorrect) {
                score++;
              }
            }
          });
        },
        child: Text(
          answer.answerText,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget nextButton(List<Question> questionlist) {
    bool isLastQuestion = currentQuestionIndex == questionlist.length - 1;

    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.30,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 34, 1, 1),
          backgroundColor: const Color.fromARGB(255, 238, 15, 15),
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(context: context, builder: (_) => showScore(questionlist));
          } else {
            setState(() {
              currentQuestionIndex++;
              selectedAnswer = null;
            });
          }
        },
        child: Text(
          isLastQuestion ? "Submit" : "Next",
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  AlertDialog showScore(List<Question> questionlist) {
    bool isPassed = score >= questionlist.length * 0.3;
    String title = isPassed ? "Passed" : "Failed";

    return AlertDialog(
      title: Text(
        "$title \n \nScore: $score",
        style: TextStyle(
            color: isPassed ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      content: ElevatedButton(
        child: const Text(
          "Restart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: () {
           Navigator.pop(context);
          if (mounted) {
            setState(() {
              currentQuestionIndex = 0;
              score = 0;
              selectedAnswer = null;
            });
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:p3_quiz_app/widgets/answer.dart';
import 'package:p3_quiz_app/widgets/question.dart';

class QuizQuestion extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, dynamic>> questions;
  final Function answerQuestion;

  const QuizQuestion(
      {required this.questionIndex,
      required this.questions,
      required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ), //Question
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}

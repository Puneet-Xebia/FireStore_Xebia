import 'package:firestore_poc/models/question.dart';
import 'package:firestore_poc/routes/question_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionsList extends StatefulWidget {
  @override
  _QuestionsListState createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<List<Questions>>(context) ?? [];
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        return QuestionTile(
          question: questions[index],
        );
      },
    );
  }
}

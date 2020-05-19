import 'package:firestore_poc/models/question.dart';
import 'package:firestore_poc/routes/question_update.dart';
import 'package:firestore_poc/services/database.dart';
import 'package:flutter/material.dart';

class QuestionTile extends StatelessWidget {
  final Questions question;
  QuestionTile({this.question});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionUpdate(questionObj: question)));
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Text(question.marks.toString(), style: TextStyle(color: Colors.white)),
          ),
          title: Text(question.question),
          subtitle: Text(question.answer),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await Database().deleteQuestionDocument(question.questionId);
            },
          ),
        ),
      ),
    );
  }
}

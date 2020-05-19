import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_poc/models/question.dart';

class Database {
  // Collection Reference
  final CollectionReference questionCollection = Firestore.instance.collection('questions');

  // Add Question
  Future<bool> addQuestionDocument(String question, String answer, int marks) async {
    try {
      await questionCollection.add({
        "question": question,
        "answer": answer,
        "marks": marks,
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Delete Question Document
  Future<bool> deleteQuestionDocument(String documentID) async {
    try {
      await questionCollection.document(documentID).delete();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Update Question Document
  Future<bool> updateQuestionDocument(Questions questionObj) async {
    try {
      await questionCollection.document(questionObj.questionId).setData({
        "question": questionObj.question,
        "answer": questionObj.answer,
        "marks": questionObj.marks,
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Get Brew List from Snapshot
  // List<Questions> _questionsListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return Questions(
  //       question: doc.data["question"],
  //       answer: doc.data["answer"],
  //       marks: doc.data["marks"],
  //     );
  //   }).toList();
  // }

  List<Questions> questionsListFromQuerySnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Questions(
        questionId: doc.documentID,
        question: doc.data["question"],
        answer: doc.data["answer"],
        marks: doc.data["marks"],
      );
    }).toList();
  }

  // Stream for getting data
  Stream<List<Questions>> get questionsList {
    return questionCollection.snapshots().map(questionsListFromQuerySnapShot);
  }
}

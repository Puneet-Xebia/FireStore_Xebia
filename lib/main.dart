import 'package:firestore_poc/models/question.dart';
import 'package:firestore_poc/routes/question_add_form.dart';
import 'package:firestore_poc/routes/questions_list.dart';
import 'package:firestore_poc/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Questions>>.value(
      value: Database().questionsList,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Text("Firestore POC"),
          centerTitle: true,
        ),
        body: QuestionsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionForm()));
          },
          backgroundColor: Colors.indigoAccent,
          child: Icon(Icons.add, size: 32),
        ),
      ),
    );
  }
}

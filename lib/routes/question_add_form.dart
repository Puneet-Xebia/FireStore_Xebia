import 'package:firestore_poc/global/constants.dart';
import 'package:firestore_poc/services/database.dart';
import 'package:flutter/material.dart';

class QuestionForm extends StatefulWidget {
  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final _formkey = GlobalKey<FormState>();

  String _question = '';
  String _answer = '';
  int _marks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Add Question"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Text(
                  "Create Question",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Question"),
                  validator: (val) => val.isEmpty ? 'Please enter question' : null,
                  onChanged: (val) {
                    setState(() {
                      _question = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Answer"),
                  validator: (val) => val.isEmpty ? "Please enter question's answer" : null,
                  onChanged: (val) {
                    setState(() {
                      _answer = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Marks"),
                  validator: (val) => val.isEmpty ? 'Please enter mark' : null,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    setState(() {
                      _marks = int.parse(val);
                    });
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.indigoAccent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                    child: Text("Add Question", style: TextStyle(color: Colors.white)),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      print("$_question : $_answer : $_marks");
                      await Database().addQuestionDocument(_question, _answer, _marks);
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

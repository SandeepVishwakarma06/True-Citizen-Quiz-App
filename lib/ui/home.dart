// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:true_citizen_app/model/question.dart';

class QuizApp extends StatefulWidget {
  QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // ignore: unused_field, prefer_final_fields
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name("Gandhi was the first Prime Minister of India?", false),
    Question.name("Cricket is the National sport of India?", false),
    Question.name("India is the world's largest producer of bananas?", true),
    Question.name(
        "Around 82% of Indian households keep a pet elephant?", false),
    Question.name("Christianity is the third biggest religion in India?", true),
    Question.name(
        "Roughly Fifty Percent of Indians work in agriculture?", true),
    Question.name("Almost all Indians are vegetarian?", false),
    Question.name("The River Indus originates in India?", false),
    Question.name("India drives on the right side of the road?", false),
    Question.name(
        "Around 82% of Indian households keep a pet elephant?", false),
    Question.name("India does not have any Active Volcanoes?", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("True Citizen"),
        centerTitle: true,
        //                    backgroundColor: Colors.blueGrey,
      ),
      // backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/bharat.png",
                  width: 300,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(14.4)),
                  height: 120,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        // style: TextStyle(
                        //   fontSize: 18.0,
                        //   fontWeight: FontWeight.bold,
                        //   fontStyle: FontStyle.italic,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => _previousQuestion(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade900),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  ElevatedButton(
                      onPressed: () => _checkAnshwer(true, context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade900),
                      child: Text(
                        "TRUE",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () => _checkAnshwer(false, context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade900),
                      child: Text(
                        "FALSE",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () => _nextQuestion(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade900),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnshwer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text(
            "Correct",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      //Correct Answer
      _updateQuestion();
      debugPrint("Yes Correct");
    } else {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text(
            "Incorrect",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint("Incorrect");
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}

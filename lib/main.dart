import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'Whats your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Green', 'score': 1},
      ],
    },
    {
      'questionText': 'Whats your favourite animal?',
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Lion', 'score': 3},
        {'text': 'Rat', 'score': 1},
      ],
    },
    {
      'questionText': 'Who is your favourite Instructor?',
      'answers': [
        {'text': 'Ranjit', 'score': 10},
        {'text': 'Nepal', 'score': 5},
        {'text': 'Max', 'score': 3},
        {'text': 'Rwat', 'score': 1},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

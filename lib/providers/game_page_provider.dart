import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxquestions = 10;

  List? questions;
  int _currentQuestionscount = 0;

  BuildContext context;
  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuestionsfromAPI();
  }

  Future<void> _getQuestionsfromAPI() async {
    var _response = await _dio.get(
      '',
      queryParameters: {
        'amount': 10,
        'type': 'boolean',
        'difficulty': 'easy',
      },
    );
    var _data = jsonDecode(
      _response.toString(),
    );
    questions = _data["results"];
    notifyListeners();
  }

  String getcurrentquestionstext() {
    return questions![_currentQuestionscount]["question"];
  }

  void answerquestion(String _answer) async {
    bool iscorrect =
        questions![_currentQuestionscount]["correct_answer"] == _answer;
    _currentQuestionscount++;
    // print(iscorrect ? "correct" : "incorrect");
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: iscorrect ? Colors.green : Colors.red,
            title: Icon(
              iscorrect ? Icons.check_circle : Icons.cancel_sharp,
              color: Colors.white,
            ),
          );
        },
        );
        await Future.delayed(Duration(seconds: 1),);
        Navigator.pop(context);
        notifyListeners();
  }
}

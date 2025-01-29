import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class levelThreeScreen extends StatefulWidget {
  final String UsernamelevelThree;

  const levelThreeScreen({
    Key? key,
    required this.UsernamelevelThree,
  }) : super(key: key);

  @override
  State<levelThreeScreen> createState() => _LevelThreeScreenState();
}

class _LevelThreeScreenState extends State<levelThreeScreen> {
  List<dynamic> _quizData = [];
  int _currentQuestionIndex = 0;
  int _selectedAnswer = -1;
  int _score = 0;
  String name = '';

  @override
  void initState() {
    super.initState();
    _fetchQuizData();
  }

  void _fetchQuizData() async {
    final body = jsonEncode({
      'name': widget.UsernamelevelThree,
    });

    name = widget.UsernamelevelThree;

    print('Name being sent level three result: ${name}');

    try {
      final response = await http.post(
        Uri.parse('http://192.168.18.3:7020/quiz_leval_Three'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
        if (jsonData['success']) {
          setState(() {
            _quizData = (jsonData['record'] as List<dynamic>)
                .map((record) => {
                      "question": record["quetion"] ?? "",
                      "answer1": record["answer1"] ?? "Option 1",
                      "answer2": record["answer2"] ?? "Option 2",
                      "answer3": record["answer3"] ?? "Option 3",
                      "correct": record["correct"] ?? -1,
                    })
                .toList();
          });
        } else {
          _showError(jsonData['message']);
        }
      } else {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
        _showError("Failed to fetch quiz data");
      }
    } catch (error) {
      print(error);
      _showError("Error: $error");
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Message"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _handleAnswerSelection(int index) {
    setState(() {
      _selectedAnswer = index;
    });

    if (index == _quizData[_currentQuestionIndex]['correct']) {
      _score++;
    }
  }

  void _nextQuestion() {
    if (_selectedAnswer == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an answer'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_currentQuestionIndex < _quizData.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = -1;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => resultScreen(
            correctAnswers: _score,
            wrongAnswers: _quizData.length - _score,
            levalname: "Leval Three",
            resultusername: name,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_quizData.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF14213D),
          title: const Text(
            'Quiz App',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFF87CEEB),
        body: const Center(
          child: Text(
            'Quiz is not ready',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    final question = _quizData[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF14213D),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Quiz App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF87CEEB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${_currentQuestionIndex + 1}/${_quizData.length}',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Score: $_score',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF14213D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                question['question'],
                style: const TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                _buildAnswerOption(0, question['answer1']),
                _buildAnswerOption(1, question['answer2']),
                _buildAnswerOption(2, question['answer3']),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14213D),
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              ),
              onPressed: _nextQuestion,
              child: const Text(
                'NEXT',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOption(int index, String text) {
    return GestureDetector(
      onTap: () {
        _handleAnswerSelection(index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _selectedAnswer == index
              ? const Color(0xFF14213D)
              : const Color(0xFFFFFFFF),
          border: Border.all(color: const Color(0xFF14213D)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: _selectedAnswer == index ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

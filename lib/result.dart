import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quizapp/dashbordScreen.dart';
import 'package:quizapp/levelOneScreen.dart';

class resultScreen extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final String levalname;
  final String resultusername;

  const resultScreen({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.levalname,
    required this.resultusername,
  }) : super(key: key);

  Future<void> saveQuizResult(BuildContext context) async {
    final url = Uri.parse("http://192.168.18.3:7020/save_result_quiz");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": resultusername,
          "leval": levalname,
          "correct": correctAnswers,
          "wrong": wrongAnswers,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseData['message']),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseData['message'] ?? "Failed to save result"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF87CEEB), // Light blue background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF14213D), // Dark color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Summary Of Your Result In $levalname',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),
            Text(
              'UserName is: $resultusername',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              'Correct Answers: $correctAnswers',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              'Wrong Answers: $wrongAnswers',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              'Level Score: $levalname',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF14213D), // Dark color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashbordScreen(
                            Usernamefromsplash: resultusername
                        ),
                      ),
                    );
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.home, size: 30, color: Colors.white),
                      Text('Home',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF14213D), // Dark color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LevelOneScreen(
                            UsernamelevelOne: resultusername
                        ),
                      ),
                    );
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.refresh, size: 30, color: Colors.white),
                      Text('Replay',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF14213D), // Dark color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () async {
                    await saveQuizResult(context);
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.arrow_forward, size: 30, color: Colors.white),
                      Text('Save',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

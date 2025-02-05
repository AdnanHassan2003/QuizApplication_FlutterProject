import 'package:flutter/material.dart';
import 'package:quizapp/dashbordScreen.dart';


class SplashScreen extends StatelessWidget {
  final String Username;


  const SplashScreen({
    Key? key,
    required this.Username,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = Username;
    print("Username is splashscreen: $name");
    return Scaffold(
      backgroundColor: const Color(0xFF87CEEB), // Light blue background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top Welcome Text
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF14213D), // Maroon background
            child: const Text(
              'Welcome To Quiz Your Mind',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Center Image
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/globalnetwork.png', // Replace with your image
                width: 350,
                height: 350,
              ),
            ),
          ),

          // Bottom Button
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF14213D), // Maroon color
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashbordScreen(
                          Usernamefromsplash: name
                      ),
                    ),
                  );
                },
                child: const Text(
                  'More Than 50 Questions Here',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

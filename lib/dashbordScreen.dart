import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/levelFiveScreen.dart';
import 'package:quizapp/levelFourScreen.dart';
import 'package:quizapp/levelOneScreen.dart';
import 'package:quizapp/levelThreeScreen.dart';
import 'package:quizapp/levelTwoScreen.dart';

class DashbordScreen extends StatelessWidget {
  final String Usernamefromsplash;

  const DashbordScreen({
    Key? key,
    required this.Usernamefromsplash,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = Usernamefromsplash;
    print("Username is dashboad: $Usernamefromsplash");
    return Scaffold(appBar:
    AppBar(
      title: const Text(
        'Aqoon Side',
        style: TextStyle(color: Colors.white), // Set text color to white
      ),
      backgroundColor: const Color(0xFF14213D), // Dark blue background
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/quiz.jpg'), // Add your logo image here
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout), // Logout icon
          color: Colors.white, // Set icon color to white
          onPressed: () {
            // Add your logout functionality here
            SystemNavigator.pop();
          },
        ),
      ],
    ),


      backgroundColor: const Color(0xFF87CEEB), // Light gray background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your buttons here
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14213D), // Maroon color
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Reduced horizontal padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelOneScreen(
                        UsernamelevelOne: name
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Level One',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14213D), // Maroon color
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Reduced horizontal padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => levelTwoScreen(
                        UsernamelevelTwo: name
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Level Two',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14213D), // Maroon color
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Reduced horizontal padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => levelThreeScreen(
                        UsernamelevelThree: name
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Level Three',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14213D), // Maroon color
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Reduced horizontal padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => levelFourScreen(
                        UsernamelevelFour: name
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Level Four',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14213D), // Maroon color
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Reduced horizontal padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => levelFiveScreen(
                        UsernamelevelFive: name
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Level Five',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
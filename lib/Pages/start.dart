import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/board.dart';
import 'package:flutter_application_1/function/player.dart'; // Make sure to create/import this

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(108, 159, 224, 236),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('Start button pressed!');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerSetupWidget(
                      onStartGame: (name1,name2) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Board(
                              player1Name: name1,
                              
                              player2Name: name2,
                              
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.deepPurple,

              ),
              child: Text(
                'Start',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

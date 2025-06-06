import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/board.dart';

class PlayerSetupWidget extends StatefulWidget {
  final void Function(String name1, String name2) onStartGame;

  const PlayerSetupWidget({super.key, required this.onStartGame});

  @override
  State<PlayerSetupWidget> createState() => _PlayerSetupWidgetState();
}

class _PlayerSetupWidgetState extends State<PlayerSetupWidget> {
  final _player1NameController = TextEditingController();

  final _player2NameController = TextEditingController();

  void _submit() {
    final name1 = _player1NameController.text.trim();

    final name2 = _player2NameController.text.trim();

    if (name1.isNotEmpty && name2.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Board(player1Name: name1, player2Name: name2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all fields and use different coins."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(110, 134, 175, 182),
      appBar: AppBar(
        title: Text("Enter Player Details"),
        backgroundColor: const Color.fromARGB(183, 149, 228, 238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 250,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(183, 149, 228, 238),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _player1NameController,
                  decoration: InputDecoration(
                    labelText: "Player 1 Name or Id",
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 20),
              Container(
                height: 50,
                width: 250,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(183, 149, 228, 238),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _player2NameController,
                  decoration: InputDecoration(
                    labelText: "Player 2 Name or Id",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 181, 162, 214),
                ),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(child: Text("Start Game",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/function/board_function.dart';

class Board extends StatefulWidget {
  final String player1Name;

  final String player2Name;

  const Board({
    super.key,
    required this.player1Name,

    required this.player2Name,
  });

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final BoardLogic board = BoardLogic();
  bool isPlayerOne = true;
  String get player1Name => widget.player1Name;
  String get player2Name => widget.player2Name;

  void _handleTap(int col) {
    String coin = isPlayerOne ? "o" : "x";

    bool placed = board.setCoin(col, coin);
    if (placed) {
      setState(() {
        isPlayerOne = !isPlayerOne;
      });
      if (board.checkWin(coin)) {
        _showWinDialog(coin);
      }
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Winner!"),
            content: Text(
              "Player ${winner == "X" ? player1Name : player2Name} Wins!",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    board.resetBoard();
                    isPlayerOne = true;
                  });
                  Navigator.pop(context);
                },
                child: Text("Play Again"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Game Grid'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color.fromARGB(110, 134, 175, 182),
      body: Column(
        
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 60,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: Text(
              player1Name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20), // Space between the two containers
          Container(
            height: 60,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: Text(
              player2Name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20), // Space between the two containers
          Container(
            height: 60,
            width: 400,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: Text(
              "Current Player: ${isPlayerOne ? player1Name : player2Name}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // SizedBox(height: 20),
          // Text("Current Player: ${isPlayerOne ? "X" : "O"}"),
          SizedBox(height: 30),
          Column(
            children: List.generate(board.rows, (row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(board.cols, (col) {
                  return GestureDetector(
                    onTap: () => _handleTap(col),
                    child: Container(
                      margin: EdgeInsets.all(4),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            board.grid[row][col] == '_'
                                ? Colors.grey[300]
                                : board.grid[row][col] == 'x'
                                ? Colors.red
                                : const Color.fromARGB(255, 54, 221, 12),
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
  }
}

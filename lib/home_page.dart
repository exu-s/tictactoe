// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true; // first player

  List<String> display = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  var myTextStyl = const TextStyle(color: Colors.white, fontSize: 30);

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Player O',
                      style: myTextStyl,
                    ),
                    Text(
                      oScore.toString(),
                      style: myTextStyl,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Player X',
                      style: myTextStyl,
                    ),
                    Text(
                      xScore.toString(),
                      style: myTextStyl,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                    ),
                    child: Center(
                      child: display[index] == 'X'
                          ? Text(
                              display[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 35),
                            )
                          : Text(
                              display[index],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 35),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.blue,
          ))
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && display[index] == '' || display[index] == 'O') {
        display[index] = 'O';
        filledBoxes += 1;
      } else if (!oTurn && display[index] == '' || display[index] == 'X') {
        display[index] = 'X';
        filledBoxes += 1;
      }

      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // 1st row
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != '') {
      _showWin(display[0]);
    }

    // 2nd row
    if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != '') {
      _showWin(display[3]);
    }

    // 3rd row
    if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != '') {
      _showWin(display[6]);
    }

    // 1st column
    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != '') {
      _showWin(display[0]);
    }

    // 1st column
    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != '') {
      _showWin(display[0]);
    }

    // 2nd column
    if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != '') {
      _showWin(display[1]);
    }

    // 3rd column
    if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != '') {
      _showWin(display[2]);
    }

    // 1st diagonal
    if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != '') {
      _showWin(display[0]);
    }

    // 2nd diagonal
    if (display[2] == display[4] &&
        display[2] == display[6] &&
        display[2] != '') {
      _showWin(display[2]);
    } else if (filledBoxes == 9) {
      _showDraw();
    }
  }

  void _showWin(String W) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: ' + W),
            actions: [
              TextButton(
                child: const Text('Play Again'),
                onPressed: () {
                  _clearBoardWin();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (W == 'O') {
      oScore += 1;
    } else if (W == 'X') {
      xScore += 1;
    }
  }

  void _showDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('DRAW'),
            actions: [
              TextButton(
                child: const Text('Play Again'),
                onPressed: () {
                  _clearBoardWin();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _clearBoardWin() {
    setState(
      () {
        for (var i = 0; i < 9; i++) {
          display[i] = '';
        }
      },
    );

    filledBoxes = 0;
  }
}

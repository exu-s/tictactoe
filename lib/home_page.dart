// ignore_for_file: prefer_interpolation_to_compose_strings

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Text(
                    display[index],
                    style: const TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn) {
        display[index] = 'O';
      } else {
        display[index] = 'X';
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
    }
  }

  void _showWin(String W) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: ' + W),
          );
        });
  }
}

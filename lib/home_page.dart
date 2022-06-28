import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String display = '';

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
              onTap: _tapped,
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Text(
                    display,
                    style: const TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _tapped() {
    setState(() {
      display = 'O';
    });
  }
}

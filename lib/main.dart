import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[600],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red[600],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int total = 2;

  void randoming() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
    total = leftDiceNumber + rightDiceNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Caprasimo-Regular.ttf',
                fontWeight: FontWeight.bold,
                color: Colors.white,
            ),
            'The Dices total is : $total'),
        Row(
          children: [
            Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      randoming();
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset("images/dice$leftDiceNumber.png"),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Image.asset("images/dice$rightDiceNumber.png"),
                      ),
                    ],
                  ),
                )),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red[700],
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0)))
            ),
            onPressed: () {
              setState(() {
                randoming();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shuffle_on_outlined,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      'shuffle the dices')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dicesList = [
    'assets/photos/dice1.png',
    'assets/photos/dice2.png',
    'assets/photos/dice3.png',
    'assets/photos/dice4.png',
    'assets/photos/dice5.png',
    'assets/photos/dice6.png',
  ];
  int chosen1 = 0;
  int chosen2 = 0;

  int score = 0;
  int maxScore = 0;
  @override
  void initState() {
    super.initState();
    chosen1 = Random().nextInt(6);
    chosen2 = Random().nextInt(6);
  }

  void rollDice() {
    setState(() {
      chosen1 = Random().nextInt(6);
      chosen2 = Random().nextInt(6);
    });
  }

  void equal() {
    setState(() {
      if (chosen1 == chosen2) {
        score += 1;
        rollDice();
      } else {
        maxScore = max(score, maxScore);
        rollDice();
        score = 0;
      }
    });
  }

  void notEqual() {
    setState(() {
      if (chosen1 != chosen2) {
        score += 1;
        rollDice();
      } else {
        maxScore = max(score, maxScore);
        rollDice();
        score = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff72383d),
      appBar: AppBar(
        backgroundColor: Color(0xff72383d),
        elevation: 0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text('Dice Game',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ]),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Max Score: $maxScore',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(dicesList[chosen1]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(dicesList[chosen2]),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    equal();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff72383d),
                    side: BorderSide(color: Colors.white, width: 3),
                  ),
                  child: const Text(
                    'Equal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    notEqual();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff72383d),
                    side: BorderSide(color: Colors.white, width: 3),
                  ),
                  child: const Text(
                    'Not Equal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              'Score: $score',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

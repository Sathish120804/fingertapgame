import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.red,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: const Text('Start'),
                shape: const CircleBorder(),
                color: Colors.white,
                height: 150,
                minWidth: 150,
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: const Text('Start'),
                shape: const CircleBorder(),
                color: Colors.white,
                height: 150,
                minWidth: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double redHeight = 0;
  double blueHeight = 0;
  bool firstBuild = false;
  int playerAScore = 0;
  int playerBScore = 0;

  @override
  Widget build(BuildContext context) {
    if (!firstBuild) {
      double half = MediaQuery.of(context).size.height / 2;
      redHeight = half;
      blueHeight = half;
      firstBuild = true;
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double winningHeight = screenHeight - 50;

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                redHeight += 30;
                blueHeight -= 30;
                playerAScore += 5;
              });

              if (redHeight >= winningHeight) {
                print('PLAYER A WINS');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(playerAScore, 'A'),
                  ),
                );
              }
            },
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: redHeight,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Expanded(child: Text('PLAYER A')),
                  Text('$playerAScore'),
                ],
              ),
            ),
          ),

          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                blueHeight += 30;
                redHeight -= 30;
                playerBScore += 5;
              });

              if (blueHeight >= winningHeight) {
                print('PLAYER B WINS');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(playerBScore, 'B'),
                  ),
                );
              }
            },
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              height: blueHeight,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Expanded(child: Text('PLAYER B')),
                  Text('$playerBScore'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final String player;

  const ResultPage(this.score, this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == 'A' ? Colors.red : Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              player == 'A' ? "PLAYER A WINS" : "PLAYER B WINS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              child: Text('RESTART A GAME!'),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

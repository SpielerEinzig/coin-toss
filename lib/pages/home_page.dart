import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Random random = Random();
  int coinStatus = 1;

  flipCoin() {
    coinStatus = random.nextInt(2) + 1;
  }

  void playSound() {
    final player = AudioCache();
    player.play('audio/coinflip.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  //implement onPressed functionality
                  setState(() {
                    playSound();
                    flipCoin();
                  });
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("image/coin$coinStatus.jpg"),
                  maxRadius: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

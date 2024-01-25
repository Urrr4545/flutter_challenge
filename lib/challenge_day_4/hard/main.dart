import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ChallengeHardScreenDay4 extends StatefulWidget {
  const ChallengeHardScreenDay4({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay4> createState() =>
      _ChallengeHardScreenDay4State();
}

class _ChallengeHardScreenDay4State extends State<ChallengeHardScreenDay4> {
  late Timer timer;
  String elapsedTime = "";
  Stopwatch stopWatch = Stopwatch();
  late double width = MediaQuery.of(context).size.width;
  late double circlePosX = 0;
  late double circlePosY = 0;

  void startTimer() {
    stopWatch.start();
    timer = Timer.periodic(const Duration(milliseconds: 1), (Timer timer) {
      setState(() {
        elapsedTime =
            Duration(milliseconds: stopWatch.elapsedMilliseconds).toString();
      });
    });
  }

  void stopTimer() {
    stopWatch.stop();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Catch Circle Game"),
          centerTitle: true,
        ),
        body: Material(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  int maxWidth = width.toInt() - 50;
                  circlePosX = Random().nextInt(maxWidth).toDouble();
                  circlePosY = Random().nextInt(maxWidth).toDouble();
                  setState(() {
                    stopWatch.reset();
                    elapsedTime = const Duration(milliseconds: 0).toString();
                  });
                  Future.delayed(const Duration(milliseconds: 500), () {
                    startTimer();
                  });
                },
                child: const Text("start"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                elapsedTime,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black,
                width: width,
                height: width,
                child: Stack(children: [
                  Positioned(
                    left: circlePosX,
                    top: circlePosY,
                    child: buildCircleWidget(),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCircleWidget() {
    return GestureDetector(
      onTap: () => setState(() {
        stopTimer();
      }),
      child: Visibility(
        visible: stopWatch.isRunning,
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

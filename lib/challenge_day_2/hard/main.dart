import 'dart:math' as math;

import 'package:flutter/material.dart';

class ChallengeHardScreenDay2 extends StatefulWidget {
  const ChallengeHardScreenDay2({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay2> createState() =>
      _ChallengeHardScreenDay2State();
}

class _ChallengeHardScreenDay2State extends State<ChallengeHardScreenDay2>
    with TickerProviderStateMixin {
  late AnimationController rotateController, translateController;
  late Animation animation;
  late double currentHeightOffset = 0;
  late double starSize;
  late double maxWidth = MediaQuery.of(context).size.width;
  late double maxHeight = MediaQuery.of(context).size.height;

  @override
  void dispose() {
    rotateController.dispose();
    translateController.dispose();
    super.dispose();
  }

  void init() {
    starSize = maxHeight / 5;

    rotateController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    translateController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: maxWidth,
    ).animate(translateController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          currentHeightOffset += starSize;
          if (currentHeightOffset >= maxHeight) {
            currentHeightOffset = 0;
          }
          translateController.reset();
          translateController.forward();
        }
      });

    translateController.forward();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return SafeArea(
      child: Scaffold(
          appBar: null,
          body: AnimatedBuilder(
            animation: rotateController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(animation.value, currentHeightOffset),
                child: Transform.rotate(
                  angle: rotateController.value * 2 * math.pi,
                  child: child,
                ),
              );
            },
            child: Icon(
              Icons.star,
              size: starSize,
            ),
          )),
    );
  }
}

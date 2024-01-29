import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeHardScreenDay6 extends StatefulWidget {
  const ChallengeHardScreenDay6({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay6> createState() =>
      _ChallengeHardScreenDay6State();
}

class _ChallengeHardScreenDay6State extends State<ChallengeHardScreenDay6>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  bool isClick = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          controller.forward(from: 0);
        });
      }
    });
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Container(
          color: Colors.black,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: isClick
                    ? SweepGradient(
                        colors: const [
                          Colors.red,
                          Colors.white,
                          Colors.red,
                        ],
                        stops: const [0.1, 0.45, 0.7],
                        transform: GradientRotation(controller.value * 2.3),
                      )
                    : null,
                boxShadow: isClick
                    ? [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.6),
                          spreadRadius: 1.5,
                          blurRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (!isClick) {
                      isClick = true;
                      controller.forward();
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Flutter Boot \nClick Me 😎",
                      style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          shadows: isClick
                              ? [
                                  const Shadow(
                                      color: Colors.red,
                                      blurRadius: 1,
                                      offset: Offset(0, 1)),
                                  const Shadow(
                                      color: Colors.red,
                                      blurRadius: 1,
                                      offset: Offset(1, 0)),
                                  const Shadow(
                                      color: Colors.red,
                                      blurRadius: 1,
                                      offset: Offset(0, -1)),
                                  const Shadow(
                                      color: Colors.red,
                                      blurRadius: 1,
                                      offset: Offset(-1, 0)),
                                ]
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

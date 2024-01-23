import 'package:flutter/material.dart';

class ChallengeNormalScreenDay2 extends StatefulWidget {
  const ChallengeNormalScreenDay2({Key? key}) : super(key: key);

  @override
  State<ChallengeNormalScreenDay2> createState() =>
      _ChallengeNormalScreenDay2State();
}

class _ChallengeNormalScreenDay2State extends State<ChallengeNormalScreenDay2>
    with TickerProviderStateMixin {
  double gPercent = 0;
  int mScore = 0;

  late AnimationController controller;
  late Animation animation;

  void animationChangedListener() {
    setState(() {
      gPercent = animation.value;
    });
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: 0.0).animate(controller)
      ..addListener(animationChangedListener)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            mScore = 0;
          });
        }
      });
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
        body: Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Your score',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$mScore',
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(
                    right: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          width: 300,
                          height: 30,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            child: LinearProgressIndicator(
                              value: gPercent,
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            gPercent += 0.2;
                            if (gPercent > 1.0) {
                              gPercent = 1.0;
                            }

                            if (gPercent > 0.9) {
                              mScore++;
                            }
                          });

                          animation =
                              Tween<double>(begin: gPercent, end: 0.0).animate(
                            CurvedAnimation(
                              parent: controller,
                              curve: Curves.easeOut,
                            ),
                          );

                          controller.forward(from: 0.0);
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(15)),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

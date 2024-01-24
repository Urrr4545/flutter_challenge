import 'package:flutter/material.dart';

class ChallengeHardScreenDay3 extends StatefulWidget {
  const ChallengeHardScreenDay3({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay3> createState() =>
      _ChallengeHardScreenDay3State();
}

class _ChallengeHardScreenDay3State extends State<ChallengeHardScreenDay3>
    with TickerProviderStateMixin {
  double circleScaleValue = 0.8;
  double rectScaleValue = 0.8;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox.square(
                          dimension: 130,
                          child: AnimatedScale(
                            scale: circleScaleValue,
                            duration: Duration(microseconds: 200),
                            child: ClipOval(
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 10,
                          left: 10,
                        ),
                        child: AnimatedScale(
                          scale: rectScaleValue,
                          alignment: Alignment.bottomCenter,
                          duration: Duration(microseconds: 200),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                              ),
                              color: Colors.white,
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Slider(
              value: circleScaleValue,
              min: 0.7,
              max: 1.0,
              onChanged: (double value) {
                setState(() {
                  circleScaleValue = value;
                });
              },
            ),
            Slider(
              value: rectScaleValue,
              min: 0.7,
              max: 1.0,
              onChanged: (double value) {
                setState(() {
                  rectScaleValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

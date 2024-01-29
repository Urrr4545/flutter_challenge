import 'dart:math';

import 'package:flutter/material.dart';

class ChallengeNormalScreenDay6 extends StatefulWidget {
  const ChallengeNormalScreenDay6({Key? key}) : super(key: key);

  @override
  State<ChallengeNormalScreenDay6> createState() =>
      _ChallengeNormalScreenDay6State();
}

class _ChallengeNormalScreenDay6State extends State<ChallengeNormalScreenDay6> {
  int _point = 0;
  List<int> points = [];

  @override
  void initState() {
    super.initState();
  }

  void setRandomPoints() {
    points.clear();
    points.add(Random().nextInt(100));
    points.add(Random().nextInt(100));
    points.add(Random().nextInt(100));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Your point : ${_point}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setRandomPoints();
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text(
                          "Choose your next point!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        content: const Text(
                          "Choose one of the points below! \nIf you don’t make a selection, your current score will be retained.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _point = points[0];
                              });
                              Navigator.pop(context);
                            },
                            child: Text("${points[0]}"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _point = points[1];
                              });
                              Navigator.pop(context);
                            },
                            child: Text("${points[1]}"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _point = points[2];
                              });
                              Navigator.pop(context);
                            },
                            child: Text("${points[2]}"),
                          ),
                        ],
                      );
                    }),
                  );
                },
                child: const Text('I want more points!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

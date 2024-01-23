import 'dart:math';

import 'package:flutter/material.dart';

class ChallengeHardScreenDay0 extends StatefulWidget {
  const ChallengeHardScreenDay0({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay0> createState() =>
      _ChallengeHardScreenDay0State();
}

enum ButtonType {
  Circle,
  Squares;

  static ButtonType getRandomType() {
    Random random = Random();
    return ButtonType.values[random.nextInt(ButtonType.values.length)];
  }
}

class _ChallengeHardScreenDay0State extends State<ChallengeHardScreenDay0> {
  late int squerCnt;
  late int circleCnt;

  @override
  void initState() {
    super.initState();
    squerCnt = 0;
    circleCnt = 0;
  }

  @override
  Widget build(BuildContext context) {
    var style = DefaultTextStyle.of(context).style;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Draggable"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _targetButtonWidget(targetType: ButtonType.Circle),
                  _targetButtonWidget(targetType: ButtonType.Squares)
                ],
              ),
              _draggableButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _draggableButtonWidget() {
    var type = ButtonType.getRandomType();

    Widget buttonWidget = Material(
      color: Colors.transparent,
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
            shape: type == ButtonType.Circle
                ? BoxShape.circle
                : BoxShape.rectangle,
            border: Border.all(width: 1, color: Colors.black)),
        child: const Center(
          child: Text(
            'Drag Me!',
          ),
        ),
      ),
    );

    return Draggable(
      data: type,
      childWhenDragging: const SizedBox(
        width: 100,
        height: 100,
      ),
      feedback: buttonWidget,
      child: buttonWidget,
    );
  }

  Widget _targetButtonWidget({required ButtonType targetType}) {
    return DragTarget<ButtonType>(
      onWillAccept: (type) {
        return type == targetType;
      },
      onAccept: (type) {
        setState(() {
          targetType == ButtonType.Circle ? circleCnt++ : squerCnt++;
        });
      },
      builder: (context, _candidateAvatars, _rejectedAvatars) {
        double boxBorderWidth = 1.0;

        if (_candidateAvatars.isNotEmpty &&
            _candidateAvatars.first == targetType) {
          boxBorderWidth = 2.0;
        }

        return Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              shape: targetType == ButtonType.Circle
                  ? BoxShape.circle
                  : BoxShape.rectangle,
              border: Border.all(width: boxBorderWidth, color: Colors.black)),
          child: Center(
            child: Text(
              targetType == ButtonType.Circle ? "${circleCnt}" : "${squerCnt}",
            ),
          ),
        );
      },
    );
  }
}

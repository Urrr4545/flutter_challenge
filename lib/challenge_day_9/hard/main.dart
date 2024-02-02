import 'dart:math';

import 'package:flutter/material.dart';

class ChallengeHardScreenDay9 extends StatefulWidget {
  const ChallengeHardScreenDay9({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay9> createState() =>
      _ChallengeHardScreenDay9State();
}

class _ChallengeHardScreenDay9State extends State<ChallengeHardScreenDay9> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Swipe left and right"),
          centerTitle: true,
        ),
        body: const DraggableCardWidget(),
      ),
    );
  }
}

enum AngleType {
  Idle(0),
  BottomStart(30),
  TopStart(-30);

  final double angle;
  const AngleType(this.angle);
}

class DraggableCardWidget extends StatefulWidget {
  const DraggableCardWidget({Key? key}) : super(key: key);

  @override
  State<DraggableCardWidget> createState() => _DraggableCardWidgetState();
}

class _DraggableCardWidgetState extends State<DraggableCardWidget> {
  Offset cardPosition = Offset.zero;
  bool isDragging = false;
  late Size screenSize;
  double angle = 0;
  AngleType angleType = AngleType.Idle;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      screenSize = MediaQuery.of(context).size;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Draggable(
        feedback: Container(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            var mills = isDragging ? 0 : 400;
            var center = constraints.smallest.center(Offset.zero);
            var rotate = angle * pi / 180;
            var matrix = Matrix4.identity()
              ..translate(center.dx, center.dy)
              ..rotateZ(rotate)
              ..translate(-center.dx, -center.dy);
            return AnimatedContainer(
                duration: Duration(milliseconds: mills),
                curve: Curves.easeInOut,
                transform: matrix..translate(cardPosition.dx, cardPosition.dy),
                child: _buildCard());
          },
        ),
        onDragUpdate: (detail) {
          setState(() {
            isDragging = true;
            cardPosition += detail.delta;

            if (angleType == AngleType.Idle) {
              angleType = detail.globalPosition.dy > screenSize.height / 2
                  ? AngleType.BottomStart
                  : AngleType.TopStart;
            }
            var angle = angleType.angle;
            this.angle = angle * cardPosition.dx / screenSize.width;
          });
        },
        onDragEnd: (detail) {
          setState(() {
            isDragging = false;
            cardPosition = Offset.zero;
            angleType = AngleType.Idle;
            angle = angleType.angle;
          });
        },
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.black),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/11/06/13/12/matrix-1027571_1280.jpg"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}

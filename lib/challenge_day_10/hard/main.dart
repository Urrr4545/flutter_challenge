import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeHardScreenDay10 extends StatefulWidget {
  const ChallengeHardScreenDay10({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay10> createState() =>
      _ChallengeHardScreenDay10State();
}

class _ChallengeHardScreenDay10State extends State<ChallengeHardScreenDay10> {
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

enum CardState {
  Idle(null, null),
  SuperLike("Super Like", Colors.blue),
  Like("Like", Colors.red),
  Nope("Nope", Colors.amber);

  final String? title;
  final Color? color;
  const CardState(this.title, this.color);
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
  CardState cardState = CardState.Idle;

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

            var divX = 50;
            var divY = 300;
            var isSuperLike = cardPosition.dx.abs() < divX;

            if (cardPosition.dx >= divX) {
              cardState = CardState.Like;
            } else if (cardPosition.dx <= -divX) {
              cardState = CardState.Nope;
            } else if (cardPosition.dy <= -divY && isSuperLike) {
              cardState = CardState.SuperLike;
            } else {
              cardState = CardState.Idle;
            }

            var angle = angleType.angle;
            this.angle = angle * cardPosition.dx / screenSize.width;
          });
        },
        onDragEnd: (detail) {
          setState(() {
            isDragging = false;
            angleType = AngleType.Idle;
            angle = angleType.angle;

            switch (cardState) {
              case CardState.Like:
                {
                  cardPosition += Offset(screenSize.width * 2, 0);
                  return;
                }
              case CardState.SuperLike:
                {
                  cardPosition += Offset(0, -screenSize.height * 2);
                  return;
                }
              case CardState.Nope:
                {
                  cardPosition += Offset(-screenSize.width * 2, 0);
                  return;
                }
              default:
                {
                  cardPosition = Offset.zero;
                }
            }
            cardState = CardState.Idle;
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
          child: Stack(
            children: [
              Visibility(
                visible: cardState == CardState.Like,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _buildSticker(CardState.Like),
                ),
              ),
              Visibility(
                visible: cardState == CardState.Nope,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _buildSticker(CardState.Nope),
                ),
              ),
              Visibility(
                visible: cardState == CardState.SuperLike,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildSticker(CardState.SuperLike),
                ),
              ),
            ],
          )),
    );
  }

  Widget? _buildSticker(CardState cardState) {
    if (cardState == CardState.Idle) {
      return null;
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: cardState.color!, width: 4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          cardState.title!,
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              fontSize: 40,
              color: cardState.color,
            ),
          ),
        ),
      ),
    );
  }
}

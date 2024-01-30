import 'dart:math';

import 'package:flutter/material.dart';

class ChallengeHardScreenDay7 extends StatefulWidget {
  const ChallengeHardScreenDay7({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay7> createState() =>
      _ChallengeHardScreenDay7State();
}

class _ChallengeHardScreenDay7State extends State<ChallengeHardScreenDay7> {
  GlobalKey fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/11/06/13/12/matrix-1027571_1280.jpg"),
                fit: BoxFit.cover),
          ),
          child: Container(),
        ),
        floatingActionButton: GestureDetector(
          key: fabKey,
          onTap: () {
            heartElevatorOverlay();
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.red),
                color: Colors.white),
            child: const Icon(
              Icons.favorite_rounded,
              color: Colors.red,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }

  Offset getPositionByKey(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  void heartElevatorOverlay() {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (BuildContext context) {
      Offset beginOffset = getPositionByKey(fabKey);

      return HeartElevatorWidget(
        beginOffset: beginOffset,
        screenHeight: MediaQuery.of(context).size.height,
        entry: overlayEntry,
      );
    });

    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry);
  }
}

class HeartElevatorWidget extends StatefulWidget {
  const HeartElevatorWidget({
    Key? key,
    required this.beginOffset,
    required this.screenHeight,
    this.entry,
  }) : super(key: key);

  final Offset beginOffset;
  final double screenHeight;
  final OverlayEntry? entry;

  @override
  State<HeartElevatorWidget> createState() => _HeartElevatorWidgetState();
}

class _HeartElevatorWidgetState extends State<HeartElevatorWidget>
    with TickerProviderStateMixin {
  late AnimationController heightController;
  late Animation posYAnimation;
  late Animation posXAnimation;
  late double posY;
  late double posX;
  late Color heartColor;
  late double heartSize;

  @override
  void initState() {
    double toY = widget.screenHeight / 3;
    double fromY = widget.beginOffset.dy;
    posY = fromY;
    posX = widget.beginOffset.dx - 10 + Random().nextInt(30);

    var random = Random();

    heartColor = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      0.7,
    );

    heartSize = 30 + random.nextInt(15).toDouble();

    heightController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    posYAnimation = Tween<double>(
      begin: fromY,
      end: toY,
    ).animate(heightController)
      ..addListener(() {
        setState(() {
          posY = posYAnimation.value;
          posX = posXAnimation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            widget.entry?.remove();
          });
        }
      });

    posXAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX - 5, end: posX + 5),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX + 5, end: posX - 5),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX - 5, end: posX + 5),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX + 5, end: posX - 5),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX - 5, end: posX + 5),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX + 5, end: posX - 5),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX - 5, end: posX + 5),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX + 5, end: posX - 5),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX - 5, end: posX + 5),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: posX + 5, end: posX - 5),
        weight: 10,
      ),
    ]).animate(heightController);

    heightController.forward();
    super.initState();
  }

  @override
  void dispose() {
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: heightController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(posX, posY),
              child: Icon(
                Icons.favorite_rounded,
                size: heartSize,
                color: heartColor,
              ),
            );
          },
        ),
      ],
    );
  }
}

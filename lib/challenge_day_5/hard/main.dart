import 'package:flutter/material.dart';

class ChallengeHardScreenDay5 extends StatefulWidget {
  const ChallengeHardScreenDay5({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay5> createState() =>
      _ChallengeHardScreenDay5State();
}

class _ChallengeHardScreenDay5State extends State<ChallengeHardScreenDay5>
    with TickerProviderStateMixin {
  int shootCnt = 0;

  GlobalKey fabKey = GlobalKey();
  GlobalKey counterKey = GlobalKey();

  late AnimationController countController;
  late Animation countAnimation;

  @override
  void initState() {
    countController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("hello Shooting Star"),
          centerTitle: true,
        ),
        body: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScaleTransition(
                alignment: Alignment.center,
                scale: Tween<double>(
                  begin: 1.0,
                  end: 1.3,
                ).animate(countController),
                child: Container(
                  key: counterKey,
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$shootCnt',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Big Text!",
                      style: TextStyle(fontSize: 80, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          key: fabKey,
          onPressed: () {
            showShootingStarOverlay();
          },
          child: const Text("Shoot Star"),
        ),
      ),
    );
  }

  Offset getPositionByKey(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  void onShootedComplete() {
    setState(() {
      shootCnt++;
    });
    countController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      countController.reverse();
    });
  }

  void showShootingStarOverlay() {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (BuildContext context) {
      Offset beginOffset = getPositionByKey(fabKey);
      Offset endOffset = getPositionByKey(counterKey);

      return ShootingStarWidget(
        beginOffset: beginOffset,
        endOffset: endOffset,
        entry: overlayEntry,
        onShooted: () {
          onShootedComplete();
        },
      );
    });

    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry);
  }
}

class ShootingStarWidget extends StatefulWidget {
  const ShootingStarWidget({
    Key? key,
    required this.beginOffset,
    required this.endOffset,
    this.entry,
    required this.onShooted,
  }) : super(key: key);

  final Offset beginOffset, endOffset;
  final VoidCallback? onShooted;
  final OverlayEntry? entry;

  @override
  State<ShootingStarWidget> createState() => _ShootingStarWidgetState();
}

class _ShootingStarWidgetState extends State<ShootingStarWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation transAnimation;
  late Animation scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    controller.addListener(() {
      setState(() {});
    });

    transAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: widget.endOffset,
    ).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            widget.onShooted?.call();
            widget.entry?.remove();
          });
        }
      });

    scaleAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0),
        weight: 50,
      ),
    ]).animate(controller);

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.translate(
              offset: transAnimation.value,
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: const Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

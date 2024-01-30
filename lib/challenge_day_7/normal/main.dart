import 'package:flutter/material.dart';

class ChallengeNormalScreenDay7 extends StatefulWidget {
  const ChallengeNormalScreenDay7({Key? key}) : super(key: key);

  @override
  State<ChallengeNormalScreenDay7> createState() =>
      _ChallengeNormalScreenDay7State();
}

class _ChallengeNormalScreenDay7State extends State<ChallengeNormalScreenDay7> {
  late OverlayState overlayState;
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildButtonWidget('hello'),
                const SizedBox(
                  height: 10,
                ),
                _buildButtonWidget('press'),
                const SizedBox(
                  height: 10,
                ),
                _buildButtonWidget('any'),
                const SizedBox(
                  height: 10,
                ),
                _buildButtonWidget('button'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonWidget(String title) {
    GlobalKey globalKey = GlobalKey();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            key: globalKey,
            onPressed: () {
              buttonClickEvent(globalKey);
            },
            child: Text("${title}"),
          ),
        ),
      ],
    );
  }

  void buttonClickEvent(GlobalKey globalKey) {
    var widthCenter = MediaQuery.of(context).size.width / 2;
    var renderBox = getRenderBoxByKey(globalKey);
    var offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry?.remove();
    overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: widthCenter - 15,
        top: offset.dy - 30,
        child: IgnorePointer(
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(5),
              child: const Row(
                children: [
                  Icon(Icons.arrow_downward_sharp),
                  Text("You clicked this 😎"),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlayState.insert(_overlayEntry!);
  }

  RenderBox getRenderBoxByKey(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    return renderBox;
  }
}

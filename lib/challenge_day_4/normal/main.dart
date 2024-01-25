import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChallengeNormalScreenDay4 extends StatefulWidget {
  const ChallengeNormalScreenDay4({Key? key}) : super(key: key);

  @override
  State<ChallengeNormalScreenDay4> createState() =>
      _ChallengeNormalScreenDay4State();
}

class _ChallengeNormalScreenDay4State extends State<ChallengeNormalScreenDay4> {
  late FocusNode firstFocusNode, secondFocusNode;
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();

    firstController.text = 'hello';
    secondController.text = 'textfield';

    firstFocusNode.onKey = (node, event) {
      if (event is RawKeyDownEvent &&
          event.logicalKey == LogicalKeyboardKey.backspace) {
        if (firstController.text.isEmpty) {
          secondFocusNode.requestFocus();
          Future.delayed(const Duration(milliseconds: 50), () {
            secondController.selection = TextSelection.fromPosition(
                TextPosition(offset: secondController.text.length));
          });
          return KeyEventResult.handled;
        }
      }
      return KeyEventResult.ignored;
    };

    secondFocusNode.onKey = (node, event) {
      if (event is RawKeyDownEvent &&
          event.logicalKey == LogicalKeyboardKey.backspace) {
        if (secondController.text.isEmpty) {
          firstFocusNode.requestFocus();
          Future.delayed(const Duration(milliseconds: 50), () {
            firstController.selection = TextSelection.fromPosition(
                TextPosition(offset: firstController.text.length));
          });
          return KeyEventResult.handled;
        }
      }
      return KeyEventResult.ignored;
    };
  }

  @override
  void dispose() {
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello TextField"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  autofocus: true,
                  controller: firstController,
                  focusNode: firstFocusNode,
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  controller: secondController,
                  focusNode: secondFocusNode,
                  textInputAction: TextInputAction.next,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

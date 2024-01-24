import 'package:flutter/material.dart';

class ChallengeNormalScreenDay3 extends StatelessWidget {
  const ChallengeNormalScreenDay3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      buildFirstWidget(),
      buildSecondWidget(),
      buildThirdWidget(),
      buildFourthWidget(),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'I can layout this',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return widgetList[index];
                },
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // 스크롤 방지
              ),
              Expanded(
                child: buildBottomSheet(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Material buildFirstWidget() {
    return Material(
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Material buildSecondWidget() {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Material buildThirdWidget() {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Material buildFourthWidget() {
    return Material(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material buildBottomSheet() {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }
}

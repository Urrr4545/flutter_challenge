import 'dart:math';

import 'package:flutter/material.dart';

class ChallengeNormalScreenDay9 extends StatefulWidget {
  const ChallengeNormalScreenDay9({Key? key}) : super(key: key);

  @override
  State<ChallengeNormalScreenDay9> createState() =>
      _ChallengeNormalScreenDay9State();
}

class _ChallengeNormalScreenDay9State extends State<ChallengeNormalScreenDay9> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Click left and right"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Text("<"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Text(">"),
                  )
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  allowImplicitScrolling: true,
                  itemBuilder: (context, index) {
                    return _buildImageWidget(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWidget(int index) {
    Future.delayed(const Duration(milliseconds: 500), () {});
    return Image.network(
      getRandomImageSrc(),
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Column(
          children: [
            Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            ),
          ],
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Column(
          children: [
            Expanded(
              child: Center(
                child: Text("Image Load Failed"),
              ),
            )
          ],
        );
      },
    );
  }

  String getRandomImageSrc() {
    return 'https://picsum.photos/id/${Random().nextInt(1000) + 1}/200/200';
  }
}

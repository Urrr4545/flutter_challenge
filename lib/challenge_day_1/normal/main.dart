import 'package:flutter/material.dart';

class ChallengeNormalScreenDay1 extends StatelessWidget {
  const ChallengeNormalScreenDay1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white60,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "FlutterBoot Plus",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 18,
              ),
              buildRow(Icons.bolt, "Premium features",
                  "Plus subscribers have access to FlutterBoot+ and out latest beta features."),
              const SizedBox(
                height: 15,
              ),
              buildRow(Icons.whatshot, "Priority access",
                  "You’ll be able to use FlutterBoot+ even when demand is high"),
              const SizedBox(
                height: 15,
              ),
              buildRow(Icons.speed, "Ultra-fast",
                  "Enjoy even faster response speeds when using FlutterBoot")
            ],
          ),
        ),
        bottomSheet: buildBottomSheet(),
      ),
    );
  }

  Material buildBottomSheet() {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Restore subscription",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Auto-renews for \$25/month until canceled",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 2,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Subscribe',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(40), // NEW
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material buildRow(IconData icon, String title, String content) {
    return Material(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 48,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  content,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

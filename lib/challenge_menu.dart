import 'package:flutter/material.dart';
import 'package:flutter_challenge/challenge_day_4/normal/main.dart';

import 'challenge_day_0/hard/main.dart';
import 'challenge_day_0/normal/main.dart';
import 'challenge_day_1/hard/main.dart';
import 'challenge_day_1/normal/main.dart';
import 'challenge_day_2/hard/main.dart';
import 'challenge_day_2/normal/main.dart';
import 'challenge_day_3/hard/main.dart';
import 'challenge_day_3/normal/main.dart';
import 'challenge_day_4/hard/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void goScreen(BuildContext context, Widget screen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge List"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeNormalScreenDay0()),
                  child: const Text("0일차 기본"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeHardScreenDay0()),
                  child: const Text("0일차 심화"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeNormalScreenDay1()),
                  child: const Text("1일차 기본"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeHardScreenDay1()),
                  child: const Text("1일차 심화"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeNormalScreenDay2()),
                  child: const Text("2일차 기본"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeHardScreenDay2()),
                  child: const Text("2일차 심화"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeNormalScreenDay3()),
                  child: const Text("3일차 기본"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeHardScreenDay3()),
                  child: const Text("3일차 심화"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeNormalScreenDay4()),
                  child: const Text("4일차 기본"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () =>
                      goScreen(context, const ChallengeHardScreenDay4()),
                  child: const Text("4일차 심화"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

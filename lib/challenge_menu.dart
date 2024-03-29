import 'package:flutter/material.dart';
import 'package:flutter_challenge/challenge_day_4/normal/main.dart';
import 'package:flutter_challenge/challenge_day_8/hard/main.dart';
import 'package:flutter_challenge/challenge_day_8/normal/main.dart';

import 'challenge_day_0/hard/main.dart';
import 'challenge_day_0/normal/main.dart';
import 'challenge_day_1/hard/main.dart';
import 'challenge_day_1/normal/main.dart';
import 'challenge_day_10/hard/main.dart';
import 'challenge_day_10/normal/main.dart';
import 'challenge_day_2/hard/main.dart';
import 'challenge_day_2/normal/main.dart';
import 'challenge_day_3/hard/main.dart';
import 'challenge_day_3/normal/main.dart';
import 'challenge_day_4/hard/main.dart';
import 'challenge_day_5/hard/main.dart';
import 'challenge_day_5/normal/main.dart';
import 'challenge_day_6/hard/main.dart';
import 'challenge_day_6/normal/main.dart';
import 'challenge_day_7/hard/main.dart';
import 'challenge_day_7/normal/main.dart';
import 'challenge_day_9/hard/main.dart';
import 'challenge_day_9/normal/main.dart';

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
        child: SingleChildScrollView(
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
                height: 10,
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
                height: 10,
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
                height: 10,
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
                height: 10,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeNormalScreenDay5()),
                    child: const Text("5일차 기본"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeHardScreenDay5()),
                    child: const Text("5일차 심화"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeNormalScreenDay6()),
                    child: const Text("6일차 기본"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeHardScreenDay6()),
                    child: const Text("6일차 심화"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeNormalScreenDay7()),
                    child: const Text("7일차 기본"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeHardScreenDay7()),
                    child: const Text("7일차 심화"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeNormalScreenDay8()),
                    child: const Text("8일차 기본"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeHardScreenDay8()),
                    child: const Text("8일차 심화"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeNormalScreenDay9()),
                    child: const Text("9일차 기본"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeHardScreenDay9()),
                    child: const Text("9일차 심화"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeNormalScreenDay10()),
                    child: const Text("10일차 기본"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        goScreen(context, const ChallengeHardScreenDay10()),
                    child: const Text("10일차 심화"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

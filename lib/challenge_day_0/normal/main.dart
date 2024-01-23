import 'package:flutter/material.dart';

class ChallengeNormalScreenDay0 extends StatefulWidget {
  const ChallengeNormalScreenDay0({Key? key}) : super(key: key);

  @override
  State<ChallengeNormalScreenDay0> createState() =>
      _ChallengeNormalScreenDay0State();
}

class _ChallengeNormalScreenDay0State extends State<ChallengeNormalScreenDay0> {
  late int score;

  @override
  void initState() {
    super.initState();
    score = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.home,
            color: Colors.black,
            size: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
        title: const Text("Hello Flutter"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your score",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${score}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        score++;
                      });
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        score--;
                      });
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

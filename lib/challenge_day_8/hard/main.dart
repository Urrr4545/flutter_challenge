import 'package:flutter/material.dart';

class ChallengeHardScreenDay8 extends StatefulWidget {
  const ChallengeHardScreenDay8({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay8> createState() =>
      _ChallengeHardScreenDay8State();
}

class _ChallengeHardScreenDay8State extends State<ChallengeHardScreenDay8> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.purple,
                floating: false,
                pinned: true,
                snap: false,
                titleSpacing: 0,
                expandedHeight: 110,
                forceElevated: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(2),
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(15, 9, 15, 9),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Text(
                          "enter keyword",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.purple,
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: const Text(
                      "Flutter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ];
          },
          body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandWidget();
            },
            itemCount: 50,
          ),
        ),
      ),
    );
  }

  Widget _buildExpandWidget() {
    return const Material(
      child: ExpansionTile(
          title: Text(
            'click here!',
          ),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Expanded!',
              ),
            ),
          ]),
    );
  }
}

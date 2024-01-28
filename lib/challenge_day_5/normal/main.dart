import 'package:flutter/material.dart';

class ChallengeNormalScreenDay5 extends StatefulWidget {
  const ChallengeNormalScreenDay5({Key? key}) : super(key: key);

  @override
  State<ChallengeNormalScreenDay5> createState() =>
      _ChallengeNormalScreenDay5State();
}

final spaceData = {
  'NGC 162': 1862,
  '87 Sylvia': 1866,
  'R 136a1': 1985,
  '28978 Ixion': 2001,
  'NGC 6715': 1778,
  '94400 Hongdaeyong': 2001,
  '6354 Vangelis': 1934,
  'C/2020 F3': 2020,
  'Cartwheel Galaxy': 1941,
  'Sculptor Dwarf Elliptical Galaxy': 1937,
  'Eight-Burst Nebula': 1835,
  'Rhea': 1672,
  'C/1702 H1': 1702,
  'Messier 5': 1702,
  'Messier 50': 1711,
  'Cassiopeia A': 1680,
  'Great Comet of 1680': 1680,
  'Butterfly Cluster': 1654,
  'Triangulum Galaxy': 1654,
  'Comet of 1729': 1729,
  'Omega Nebula': 1745,
  'Eagle Nebula': 1745,
  'Small Sagittarius Star Cloud': 1764,
  'Dumbbell Nebula': 1764,
  '54509 YORP': 2000,
  'Dia': 2000,
  '63145 Choemuseon': 2000,
};

class SpaceData {
  final String area;
  final int addr;
  SpaceData({required this.area, required this.addr});
}

class _ChallengeNormalScreenDay5State extends State<ChallengeNormalScreenDay5> {
  Future<List<SpaceData>> spaceDatas = getSpaceDatas();
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToTop() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello ListView"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: spaceDatas,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildListViewWidget(snapshot);
            } else {
              return Container();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scrollToTop();
          },
          child: Icon(Icons.arrow_upward),
        ),
      ),
    );
  }

  Widget buildListViewWidget(AsyncSnapshot<List<SpaceData>> snapShot) {
    return ListView.separated(
      controller: scrollController,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      itemCount: snapShot.data!.length,
      itemBuilder: (context, index) {
        var item = snapShot.data![index];
        return buildSpaceWidget(item);
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
    );
  }

  Widget buildSpaceWidget(SpaceData item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
        color: Colors.white,
      ),
      child: Expanded(
        child: Row(
          children: [
            Text('🛰️'),
            SizedBox(
              width: 3,
            ),
            Expanded(child: Text('${item.area} was discovered in ${item.addr}'))
          ],
        ),
      ),
    );
  }

  static Future<List<SpaceData>> getSpaceDatas() async {
    List<SpaceData> spaceDataList = [];

    final getData = spaceData;
    getData.forEach((key, value) {
      spaceDataList.add(SpaceData(area: key, addr: value));
    });

    if (spaceDataList.isEmpty) {
      throw Error();
    }
    return spaceDataList;
  }
}

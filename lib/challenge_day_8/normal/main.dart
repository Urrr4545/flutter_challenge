import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResModel {
  List<PeopleModel> results = [];

  ResModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <PeopleModel>[];
      json['results'].forEach((v) {
        results.add(PeopleModel.fromJson(v));
      });
    }
  }
}

class PeopleModel {
  final String name, height, mass, hairColor, skinColor;

  PeopleModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        height = json['height'],
        mass = json['mass'],
        hairColor = json['hair_color'],
        skinColor = json['skin_color'];
}

class ApiService {
  static const String baseUrl = "https://swapi.dev/api/people/?search=";

  static Future<List<PeopleModel>> getPeopleByName(String name) async {
    final List<PeopleModel> peoples = [];
    final url = Uri.parse("$baseUrl$name");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final jsonData = jsonDecode(res.body);
      final model = ResModel.fromJson(jsonData);
      peoples.addAll(model.results);
      model.results.forEach((element) {
        print("name : ${element.name}");
      });
      return peoples;
    }

    throw Error();
  }
}

class ChallengeNormalScreenDay8 extends StatefulWidget {
  const ChallengeNormalScreenDay8({Key? key}) : super(key: key);

  @override
  State<ChallengeNormalScreenDay8> createState() =>
      _ChallengeNormalScreenDay8State();
}

class _ChallengeNormalScreenDay8State extends State<ChallengeNormalScreenDay8> {
  final textfieldController = TextEditingController();

  List<PeopleModel> peoples = [];
  bool isLoading = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textfieldController.dispose();
    super.dispose();
  }

  void fetchList(String keyword) {
    setState(() {
      isLoading = true;
      isError = false;
    });
    ApiService.getPeopleByName(keyword).then((value) {
      setState(() {
        isLoading = false;
        peoples.clear();
        peoples.addAll(value);
      });
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
        isError = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: _buildAppbar(),
          body: isLoading
              ? _buildMessageView("Loading...")
              : isError
                  ? _buildMessageView("Error")
                  : _buildPeopleListView(peoples)),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.search,
            color: Colors.black12,
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            flex: 1,
            child: TextField(
              controller: textfieldController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                hintText: 'enter keyword',
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
            onPressed: () {
              fetchList(textfieldController.text);
            },
            child: const Text('Search!'),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageView(String message) {
    return Container(
      alignment: Alignment.center,
      child: Text('$message'),
    );
  }

  Widget _buildPeopleListView(List<PeopleModel> items) {
    return items.isEmpty
        ? _buildMessageView("Empty List")
        : ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return _buildButtonWidget(item);
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          );
  }

  Widget _buildButtonWidget(PeopleModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Colors.black)),
            child: Column(
              children: [
                Text('${item.name}'),
                Text('${item.height} / ${item.mass}'),
                Text(
                    'Hair Color : ${item.hairColor} | Skin Color : ${item.skinColor}'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ChallengeHardScreenDay1 extends StatefulWidget {
  const ChallengeHardScreenDay1({Key? key}) : super(key: key);

  @override
  State<ChallengeHardScreenDay1> createState() =>
      _ChallengeHardScreenDay1State();
}

class _ChallengeHardScreenDay1State extends State<ChallengeHardScreenDay1> {
  bool isConfirmText = false;

  final textfiledController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<ChatData> chatList = [
    ChatData(
      isMe: false,
      message: 'Hello, how can I help you?',
    )
  ];

  @override
  void dispose() {
    textfiledController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void sendMessage(String message) {
    chatList.add(ChatData(
      isMe: true,
      message: message,
    ));

    chatList.add(ChatData(
        isMe: false,
        message:
            'Actually, I don\'t have any features, but one day I\'ll grow up and become ChatGPT!'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Row(
          children: [
            Text("MyGPT"),
            SizedBox(
              width: 5,
            ),
            Text(
              "3.5",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        leading: const Icon(Icons.menu),
        actions: [const Icon(Icons.edit), const Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  print('chatList.length : ${chatList.length}');
                  return buildMessage(chatList[index]);
                }),
          ),
          buildTextField(),
        ],
      ),
    );
  }

  Material buildTextField() {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 6,
                controller: textfiledController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'message',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    suffixIcon: textfiledController.text.isNotEmpty
                        ? null
                        : const Icon(Icons.graphic_eq),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 25,
                    )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: textfiledController.value.text.isEmpty
                  ? null
                  : () {
                      setState(() {
                        sendMessage(textfiledController.text);
                        textfiledController.clear();
                      });
                    },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15)),
              child: const Icon(
                Icons.arrow_upward_outlined,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Material buildMessage(ChatData data) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Container(
                color: data.isMe ? Colors.purple : Colors.green,
                height: 35,
                width: 35,
                alignment: Alignment.center,
                child: Text(
                  data.isMe ? 'FC' : 'G',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.isMe ? 'FlutterBoot' : 'MyGPT',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    data.message,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatData {
  ChatData({required this.message, required this.isMe});

  String message;
  bool isMe;
}

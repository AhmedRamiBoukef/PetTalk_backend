import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pe_talk/constants.dart';
import 'package:pe_talk/controllers/discussion_controller.dart';
import 'package:pe_talk/controllers/nav_controller.dart';
import 'package:pe_talk/models/message.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  Widget messageCard(BuildContext context, String avatar, String name,
      String message, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.0, color: grey),
            ),
            child: Image.asset(
              getImage(avatar),
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message,
                style: const TextStyle(
                  color: grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            time,
            style: const TextStyle(
              color: grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavController>(
      builder: (context, navController, child) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                height: 65,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(bottom: 10.0),
                color: mainClr,
                child: Row(
                  children: [
                    const Text(
                      'Saved Messages',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      getIcon('search2'),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SvgPicture.asset(
                      getIcon('v_dots'),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  messageCard(context, 'dog_ava', 'Nicole', 'Okk ..', '3:00'),
                  messageCard(context, 'cat_ava', 'Fushie', 'Bye', 'Yesterday'),
                  messageCard(context, 'rabbit_ava', 'Nicole', 'Okk', '3:00'),
                ]
                    .map(
                      (e) => InkWell(
                          onTap: () {
                            navController.navigate(const DiscussionScreen());
                          },
                          child: e),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<DiscussionController>(
      builder: (context, discussionController, child) {
        return Column(
          children: [
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              color: mainClr,
              child: Row(
                children: [
                  SvgPicture.asset(
                    getIcon('arrow'),
                  ),
                  SizedBox(
                    height: 30,
                    child: Image.asset(
                      getImage('cat_ava'),
                    ),
                  ),
                  const Text('  Puffy'),
                  const Spacer(),
                  SvgPicture.asset(
                    getIcon('v_dots'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('Sat, Feb 25, 2023'),
                  ),
                  Expanded(
                    // height: 320.0,
                    child: ListView.builder(
                      reverse: true,
                      itemCount: discussionController.messages.length,
                      itemBuilder: (context, index) {
                        return MessageCard(
                          message: discussionController.messages[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: message.sent ? TextDirection.rtl : TextDirection.ltr,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: SizedBox(
              height: 35.0,
              child: Image.asset(
                getImage(message.sent ? 'own' : 'cat_ava'),
              ),
            ),
          ),
          const SizedBox(width: 5.0),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 30,
              maxWidth: MediaQuery.of(context).size.width * .5,
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: mainClr,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                message.text,
                textAlign: message.sent ? TextAlign.right : TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

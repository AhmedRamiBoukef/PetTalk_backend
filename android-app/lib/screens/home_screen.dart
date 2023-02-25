import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pe_talk/constants.dart';
import 'package:pe_talk/widgets/input_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250.0,
                  height: 50.0,
                  child: PeInput(
                    hintText: 'Search',
                    textColor: Colors.black,
                    decorations: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SvgPicture.asset(
                          getIcon('search'),
                          height: 20,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      filled: true,
                      fillColor: whitish,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: mainClr,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      hintStyle: const TextStyle(
                        color: grey,
                        fontSize: 15.0,
                        letterSpacing: 1,
                      ),
                      hintTextDirection: TextDirection.ltr,
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    ),
                  ),
                ),
                Image.asset(
                  getImage('own'),
                  height: 50.0,
                  width: 50.0,
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: Builder(builder: (context) {
                List<Color> colors = [
                  const Color(0xFFF9EFCB),
                  const Color(0xFFD5EEF6),
                  const Color(0xFFF8E3FB),
                  const Color(0xFFFBE3E3),
                ];
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    20,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: colors[index % colors.length],
                        child: Center(
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: CircleAvatar(
                                radius: 26,
                                backgroundColor: colors[index % colors.length],
                                child: Image.asset(
                                  getImage('${index % 5}'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 7),
            const Text(
              'Feed',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7),
            Expanded(
              child: ListView(
                children: List.generate(
                  7,
                  (index) => Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: const Color(0xFFF0E3FB),
                            child: Image.asset(
                              getImage('3'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: 'Jenny Wilson ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'created a new post',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text('41 min ago'),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              getIcon('dots'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Image.asset(
                          getImage(Random().nextBool() ? 'chat' : 'post'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

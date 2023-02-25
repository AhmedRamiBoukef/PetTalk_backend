import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pe_talk/constants.dart';
import 'package:pe_talk/controllers/avatar_controller.dart';
import 'package:pe_talk/controllers/nav_controller.dart';
import 'package:pe_talk/screens/chat_screen.dart';
import 'package:pe_talk/widgets/input_text.dart';
import 'package:pe_talk/widgets/pe_button.dart';
import 'package:provider/provider.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key});

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  int step = 0;
  int animal = 0;
  List<String> animals = ['cat', 'dog', 'cow', 'sheep', 'horse'];
  final CarouselController crslCtrl = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AvatarController>(
        builder: (context, avatarController, child) {
      return Consumer<NavController>(
        builder: (context, navController, child) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Connect to PeT',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                step == 0
                    ? Container(
                        height: 280.0,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(30.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: mainClr,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 120.0,
                              // child: Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              // InkWell(
                              //   onTap: () {
                              //     setState(() {
                              //       animal = (animal - 1) % 5;
                              //     });
                              //   },
                              //   child: Transform.rotate(
                              //     angle: pi,
                              //     child: SvgPicture.asset(
                              //       getIcon('next'),
                              //     ),
                              //   ),
                              // ),
                              child: CarouselSlider.builder(
                                carouselController: crslCtrl,
                                itemCount: animals.length,
                                itemBuilder: (context, index, realIndex) =>
                                    Image.asset(
                                  getImage(
                                    animals[index],
                                  ),
                                ),
                                options: CarouselOptions(
                                  height: 110,
                                  autoPlayInterval: const Duration(seconds: 5),
                                  viewportFraction: 0.5,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      // selectedSlide = index;
                                    });
                                  },
                                ),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     setState(() {
                              //       step++;
                              //     });
                              //   },
                              //   child: Image.asset(
                              //     getImage(animals[animal]),
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     setState(() {
                              //       animal = (animal + 1) % 5;
                              //     });
                              //   },
                              //   child: SvgPicture.asset(
                              //     getIcon('next'),
                              //   ),
                              // ),
                              //   ],
                              // ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            PeButton(
                              son: Container(
                                height: 45,
                                width: 100,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  color: white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      color: mainClr,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  step++;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    : Container(
                        // height: 200.0,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: mainClr,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Information',
                              style: TextStyle(
                                color: white,
                                fontSize: 22.0,
                              ),
                            ),
                            const SizedBox(height: 15),
                            InkWell(
                              onTap: () async {
                                avatarController.getAvatar(context);
                              },
                              child: Container(
                                height: 90.0,
                                width: 90.0,
                                decoration: const BoxDecoration(
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 4.0,
                                      color: Color(0x44000000),
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: avatarController.avatarImage == null
                                      ? SvgPicture.asset(
                                          getIcon('add'),
                                          height: 35.0,
                                          color: mainClr,
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(45),
                                          child: Image.file(
                                            File(avatarController.avatarImage!),
                                            // height: 35.0,
                                            fit: BoxFit.cover,
                                            // color: mainClr,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              width: 150,
                              child: PeInput(
                                hintText: 'Name',
                                textAlign: TextAlign.center,
                                textColor: white,
                                decorations: const InputDecoration(
                                  // prefix: SvgPicture.asset(
                                  //   getIcon('pan'),
                                  //   fit: BoxFit.scaleDown,
                                  //   height: 20.0,
                                  // ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: white, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: white),
                                  ),
                                  hintStyle: TextStyle(
                                    color: white,
                                    fontSize: 15.0,
                                    letterSpacing: 1,
                                  ),
                                  hintTextDirection: TextDirection.ltr,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 20, 0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            PeButton(
                              son: Container(
                                height: 45,
                                width: 100,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  color: white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Talk',
                                    style: TextStyle(
                                      color: mainClr,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                navController.navigate(const ChatScreen());
                                navController.changeIndex(1);
                              },
                            ),
                          ],
                        ),
                      ),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
          );
        },
      );
    });
  }
}

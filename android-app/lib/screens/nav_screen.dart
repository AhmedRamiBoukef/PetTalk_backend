import 'package:flutter_svg/flutter_svg.dart';
import 'package:pe_talk/constants.dart';
import 'package:pe_talk/controllers/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavController>(
      create: (context) => NavController(),
      child: Consumer<NavController>(
        builder: (context, navController, child) {
          return Scaffold(
            backgroundColor: navController.currentIndex == 1 ? mainClr : white,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: navController.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    getIcon('home'),
                    height: 24.0,
                    width: 24.0,
                    fit: BoxFit.scaleDown,
                    color: navController.currentIndex == 0 ? mainClr : grey,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    getIcon('pet'),
                    height: 24.0,
                    width: 24.0,
                    fit: BoxFit.scaleDown,
                    color: navController.currentIndex == 1 ? mainClr : grey,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    getIcon('message'),
                    height: 24.0,
                    width: 24.0,
                    fit: BoxFit.scaleDown,
                    color: navController.currentIndex == 2 ? mainClr : grey,
                  ),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   icon: SvgPicture.asset(
                //     getIcon('profile'),
                //     height: 24.0,
                //     width: 24.0,
                //     fit: BoxFit.scaleDown,
                //     color: navController.currentIndex == 3 ? mainClr : grey,
                //   ),
                //   label: '',
                // ),
              ],
              // showSelectedLabels: true,
              // showUnselectedLabels: true,
              // selectedItemColor: mainClr,
              // unselectedItemColor: grey,
              // selectedLabelStyle: const TextStyle(
              //   fontSize: 15.0,
              // ),
              // unselectedLabelStyle: const TextStyle(
              //   fontSize: 14.0,
              // ),
              onTap: (index) {
                navController
                    .navigate(navController.screens.values.toList()[index]);
              },
            ),
            body: SafeArea(
              child: navController.currentScreen,
            ),
          );
        },
      ),
    );
  }
}

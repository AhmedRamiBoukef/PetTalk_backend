import 'package:flutter/widgets.dart';
import 'package:pe_talk/screens/animal_screen.dart';
import 'package:pe_talk/screens/discussion_screen.dart';
import 'package:pe_talk/screens/home_screen.dart';

class NavController extends ChangeNotifier {
  Map<String, Widget> screens = {
    'home': const HomeScreen(),
    'animal': const AnimalScreen(),
    'message': const MessagesScreen(),
    // 'profile': const Center(),
  };
  int currentIndex = 0;
  late Widget currentScreen;

  NavController() {
    currentScreen = screens.values.toList()[currentIndex];
  }

  void navigate(Widget screen) {
    currentScreen = screen;
    if (screens.values
        .toList()
        .any((s) => s.runtimeType == screen.runtimeType)) {
      currentIndex = screens.values.toList().indexOf(screen);
    }
    notifyListeners();
  }

  void changeIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }
}

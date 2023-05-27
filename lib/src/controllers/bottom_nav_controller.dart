import 'package:get/get.dart';
import 'dart:developer' as developer;

enum PageName { home, notice, board, mypage }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> pageHistory = [];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    _changePage(value, hasGesture: hasGesture);
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);

    if (!hasGesture) return; // PopAction을 통해 온 것은 추가하지 않는다.
    if (value == 0) return; // 홈화면은 추가하지 않는다.
    pageHistory.remove(value); // 이미 있으면 제거 후 추가한다.
    pageHistory.add(value);

    developer.log(pageHistory.toString(), name: "Bottom Nav History");
  }

  Future<bool> willPopAction() async {
    if (pageHistory.isEmpty) {
      developer.log("Exit App", name: "Bottom Nav History");
      return true;
    } else {
      developer.log("Go to Back Page", name: "Bottom Nav History");
      pageHistory.removeLast();
      developer.log(pageHistory.toString(), name: "Bottom Nav History");
      if (pageHistory.isEmpty) {
        _changePage(0, hasGesture: false);
      } else {
        _changePage(pageHistory.last, hasGesture: false);
      }
      return false;
    }
  }
}

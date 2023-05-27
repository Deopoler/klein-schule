import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klein_schule/src/controllers/bottom_nav_controller.dart';
import 'package:klein_schule/src/pages/board.dart';
import 'package:klein_schule/src/pages/home.dart';
import 'package:klein_schule/src/pages/mypage.dart';
import 'package:klein_schule/src/pages/notice.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: controller.willPopAction,
        child: Scaffold(
          appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: const [
              Home(),
              Notice(),
              Board(),
              MyPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: controller.pageIndex.value,
            onTap: controller.changeBottomNav,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: '홈'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.campaign_outlined), label: '공지'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.speaker_notes_outlined), label: '게시판'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline), label: '내정보'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:klein_schule/src/controllers/bottom_nav_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}

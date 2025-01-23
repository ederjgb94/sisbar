import 'package:get/get.dart';

import '../controllers/mycart_controller.dart';

class MycartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MycartController>(
      () => MycartController(),
    );
  }
}

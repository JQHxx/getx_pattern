import 'package:get/instance_manager.dart';
import 'package:getx_pattern/app/modules/detail/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}

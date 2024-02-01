import 'package:dhaka_prokash_app_task/controllers/special_top_content_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SpecialTopContentController());
  }

}
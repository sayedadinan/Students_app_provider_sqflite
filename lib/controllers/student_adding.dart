import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Studentaddcontrol extends GetxController {
  RxString imagepath = ''.obs;
  RxBool imageerror = false.obs;
  RxBool isimageselected = false.obs;
  void initialize() {
    imagepath.value = '';
    imageerror.value = false;
    isimageselected.value = false;
  }

  addimage(String imagepaths) {
    imagepath.value = imagepaths;
    isimageselected.value = true;
    // isimageselected = true;
  }
}

import 'package:get/get.dart';
import 'package:student_manage_app/controllers/student_adding.dart';
import 'package:student_manage_app/controllers/student_controller.dart';
import 'package:student_manage_app/controllers/student_edit_controller.dart';

class Initializecontrollers implements Bindings {
  @override
  void dependencies() {
    Get.put(Studentaddcontrol());
    Get.put(StudentController());
    Get.put(StudentEditcontroller());
  }
}

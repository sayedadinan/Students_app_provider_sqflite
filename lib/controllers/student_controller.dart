import 'dart:developer';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:student_manage_app/Db%20connections/db_table.dart';
import 'package:student_manage_app/Model/student_model.dart';

class StudentController extends GetxController {
  RxList<StudentModel> studentList = <StudentModel>[].obs;
  RxBool isloading = false.obs;
  @override
  void onInit() async {
    isloading.value = true;
    await fetchStudents();
    isloading.value = false;
    super.onInit();
  }

  fetchStudents() async {
    try {
      var studentsData = await SQLHelper.getAllData();
      log("Fetched data: $studentsData");

      List<StudentModel> students = studentsData.map((student) {
        return StudentModel(
          id: student['id'],
          name: student['name'],
          age: student['age'],
          study: student['study'],
          images: student['selectedImage'],
          phone: student['phone'],
        );
      }).toList();

      studentList.assignAll(students);
      log("Mapped students: $students");
    } catch (e) {
      log("Error fetching students: $e");
    }
  }

  // fetchStudents() async {
  //   try {
  //     var studentsData = await SQLHelper.getAllData();
  //     // print(studentsData);
  //     List<StudentModel> students = studentsData.map((student) {
  //       return StudentModel(
  //           id: student['id'],
  //           name: student['name'],
  //           age: student['age'],
  //           study: student['study'],
  //           images: student['selectedImage'],
  //           phone: student['phone']);
  //     }).toList();
  //     studentList.assignAll(students);
  //     print(students);
  //   } catch (e) {
  //     log("$e");
  //   }
  //   print(studentList);
  // }
}

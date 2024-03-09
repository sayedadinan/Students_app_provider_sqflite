import 'dart:developer';
import 'package:get/get.dart';
import 'package:student_manage_app/Db%20connections/db_table.dart';
import 'package:student_manage_app/Model/student_model.dart';

class StudentController extends GetxController {
  RxList<StudentModel> studentList = <StudentModel>[].obs;
  RxList<StudentModel> searchresultlist = <StudentModel>[].obs;
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

  searchdata(String query) async {
    await fetchStudents();
    if (query.isEmpty) {
      searchresultlist.value = [...studentList];
    } else {
      searchresultlist.value = studentList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

final StudentController studentController = Get.find();

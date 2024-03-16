import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:student_manage_app/Db%20connections/db_table.dart';
import 'package:student_manage_app/Model/student_model.dart';

class StudentController extends ChangeNotifier {
  List<StudentModel> studentList = <StudentModel>[];
  List<StudentModel> searchresultlist = <StudentModel>[];
  bool isloading = false;
  void onInit() async {
    isloading = true;
    notifyListeners();
    await fetchStudents();
    searchresultlist = [...studentList];
    isloading = false;
    notifyListeners();
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
      studentList.clear();
      studentList.addAll(students);
      searchdata('');
      notifyListeners();

      log("Mapped students: $students");
    } catch (e) {
      log("Error fetching students: $e");
    }
  }

  searchdata(String query) async {
    // await fetchStudents();
    if (query.isEmpty) {
      searchresultlist = [...studentList];
      // notifyListeners();
    } else {
      searchresultlist = studentList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}

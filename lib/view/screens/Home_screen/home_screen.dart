import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manage_app/controllers/student_controller.dart';
import 'package:student_manage_app/view/screens/Home_screen/widgets/floating_button.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final StudentController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 135, 142),
      ),
      body: Obx(
        () {
          if (controller.isloading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.studentList.isEmpty) {
            return Center(
              child: Text(
                "No students added",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.studentList.length,
              itemBuilder: (context, index) {
                final student = controller.studentList[index];
                return GestureDetector(
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    await Future.delayed(Duration(milliseconds: 140));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(student.name),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: const Floatbutton(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manage_app/Db%20connections/db_table.dart';
import 'package:student_manage_app/controllers/student_controller.dart';
import 'package:student_manage_app/view/screens/Edit_data/data_editing.dart';
import 'package:student_manage_app/view/screens/student_details.dart/student_detail.dart';

final StudentController controller = Get.find();

class Listtile extends StatelessWidget {
  const Listtile({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController controller = Get.find();
    return ListView.builder(
      itemCount: controller.studentList.length,
      itemBuilder: (context, index) {
        final student = controller.studentList[index];
        return GestureDetector(
            onTap: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              await Future.delayed(Duration(milliseconds: 140));
              Get.to(
                  Detailspage(
                    id: student.id!,
                    name: student.name,
                    study: student.study,
                    age: student.age,
                    phone: student.phone,
                    image: student.images,
                  ),
                  fullscreenDialog: true,
                  transition: Transition.leftToRightWithFade,
                  duration: Duration(milliseconds: 600));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Card(
                color: Color.fromARGB(255, 100, 165, 171),
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                surfaceTintColor: Color.fromARGB(255, 108, 178, 185),
                elevation: 5,
                shadowColor: Color.fromARGB(255, 108, 178, 185),
                child: ListTile(
                  title: Text(student.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(Editstudent(studentModel: student));
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          SQLHelper.deleteData(student.id!);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}

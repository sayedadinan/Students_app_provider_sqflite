import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_manage_app/Db%20connections/db_table.dart';
import 'package:student_manage_app/controllers/student_provider.dart';
import 'package:student_manage_app/view/screens/Edit_data/data_editing.dart';
import 'package:student_manage_app/view/screens/student_details.dart/student_detail.dart';

class Listtile extends StatelessWidget {
  const Listtile({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController controller = Provider.of(context);
    return ListView.builder(
      itemCount: controller.studentList.length,
      itemBuilder: (context, index) {
        final student = controller.studentList[index];
        return GestureDetector(
            onTap: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              await Future.delayed(Duration(milliseconds: 140));
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Detailspage(
                      id: student.id!,
                      name: student.name,
                      study: student.study,
                      age: student.age,
                      phone: student.phone,
                      image: student.images)));
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Editstudent(studentModel: student)));
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          SQLHelper.deleteData(student.id!, context);
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

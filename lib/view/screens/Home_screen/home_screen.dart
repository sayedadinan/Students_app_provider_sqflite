import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
// import 'package:student_manage_app/Db%20connections/db_table.dart';
// import 'package:student_manage_app/Model/student_model.dart';
import 'package:student_manage_app/controllers/student_controller.dart';
// import 'package:student_manage_app/view/screens/Edit_data/data_editing.dart';
import 'package:student_manage_app/view/screens/Home_screen/widgets/list_tile.dart';
import 'package:student_manage_app/view/screens/Home_screen/widgets/floating_button.dart';
import 'package:student_manage_app/view/screens/search_screen/search_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final StudentController controller = Get.find();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 206, 208),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(Searchscreen());
              },
              icon: Icon(Icons.search))
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: IconButton(
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      color: Color.fromARGB(255, 239, 236, 228),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.wb_sunny_outlined),
                            title: const Text('Ligt theme'),
                            onTap: () => {Get.changeTheme(ThemeData.light())},
                          ),
                          ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text('Dark theme'),
                            onTap: () => {Get.changeTheme(ThemeData.dark())},
                          ),
                        ],
                      ),
                    ),
                    isDismissible: true);
              },
              icon: Icon(Icons.menu)),
        ),
        title: Text(
          'Student List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 108, 178, 185),
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
            return Listtile();
          }
        },
      ),
      floatingActionButton: const Floatbutton(),
    );
  }
}

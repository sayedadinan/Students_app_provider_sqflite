import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_manage_app/controllers/student_provider.dart';
import 'package:student_manage_app/view/screens/Home_screen/widgets/list_tile.dart';
import 'package:student_manage_app/view/screens/Home_screen/widgets/floating_button.dart';
import 'package:student_manage_app/view/screens/search_screen/search_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentController>(context, listen: false).onInit();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 142, 142),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Searchscreen()));
              },
              icon: Icon(Icons.search))
        ],
        title: Text(
          'Student List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 108, 178, 185),
      ),
      body: Consumer<StudentController>(
        builder: (context, value, child) {
          if (value.isloading) {
            return Center(child: CircularProgressIndicator());
          } else if (value.studentList.isEmpty) {
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

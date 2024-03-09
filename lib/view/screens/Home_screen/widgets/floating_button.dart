import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manage_app/view/screens/Student_adding/student_adding_page.dart';

class Floatbutton extends StatelessWidget {
  const Floatbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 108, 178, 185),
      onPressed: () {
        Get.to(
            curve: Curves.easeInOutQuart,
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 1300),
            () => Addstudent());
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

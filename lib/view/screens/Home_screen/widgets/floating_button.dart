import 'package:flutter/material.dart';
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
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Addstudent()));
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

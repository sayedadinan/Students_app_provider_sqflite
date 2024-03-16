import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_manage_app/Db%20connections/db_table.dart';
import 'package:student_manage_app/Model/student_model.dart';
import 'package:student_manage_app/controllers/student_adding.dart';
import 'package:student_manage_app/view/screens/Student_adding/widgets/image_box.dart';
import 'package:student_manage_app/view/screens/Student_adding/widgets/savebutton.dart';
import 'package:student_manage_app/view/screens/Student_adding/widgets/textfiled.dart';

class Addstudent extends StatelessWidget {
  Addstudent({
    super.key,
  }) {}
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController classcontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Studentaddcontrol addcontroller = Provider.of(context);
    final Studentaddcontrol studentprovider = Provider.of(context);
    studentprovider.initialize();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 206, 208),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Student add',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 108, 178, 185),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ImageContainer()],
            ),
            SizedBox(
              height: 20,
            ),
            Namefield(
              namecontroller: namecontroller,
            ),
            ClassField(
              classcontroller: classcontroller,
            ),
            Agefield(
              agecontroller: agecontroller,
            ),
            phonefield(
              phonecontroller: phonecontroller,
            ),
            SizedBox(
              height: 20,
            ),
            SubmitButton(
              titletext: 'Save Student',
              onTap: () async {
                StudentModel data = StudentModel(
                    name: namecontroller.text,
                    age: agecontroller.text,
                    study: classcontroller.text,
                    images: studentprovider.imagepath.toString(),
                    phone: phonecontroller.text);
                await SQLHelper.insertdata(context, data);
                print('added');
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manage_app/Db%20connections/db_table.dart';
import 'package:student_manage_app/Model/student_model.dart';
import 'package:student_manage_app/view/screens/Student_adding/funtions/funtions.dart';
import 'package:student_manage_app/view/screens/Student_adding/widgets/image_box.dart';
import 'package:student_manage_app/view/screens/Student_adding/widgets/savebutton.dart';
import 'package:student_manage_app/view/screens/Student_adding/widgets/textfiled.dart';

class Addstudent extends StatelessWidget {
  const Addstudent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController classcontroller = TextEditingController();
    final TextEditingController agecontroller = TextEditingController();
    final TextEditingController phonecontroller = TextEditingController();
    // final Studentdatacntrl studentcntrl = Studentdatacntrl();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Student add',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 55, 135, 142),
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
              onTap: () async {
                StudentModel data = StudentModel(
                    name: namecontroller.text,
                    age: agecontroller.text,
                    study: classcontroller.text,
                    images: addcontroller.imagepath.value.toString(),
                    phone: phonecontroller.text);
                await SQLHelper.insertdata(data);
                print('added');
                Get.back();
              },
            )
            // SubmitButton(
            //   onTap: () {
            //     studentcntrl.addstudent(StudentModel(
            //         name: namecontroller.text,
            //         age: agecontroller.text,
            //         study: classcontroller.text,
            //         images: addcontroller.imagepath.value.toString(),
            //         phone: phonecontroller.text));
            //     print(namecontroller.text);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

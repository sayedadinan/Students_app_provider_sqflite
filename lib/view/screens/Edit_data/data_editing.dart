import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_manage_app/Db%20connections/db_table.dart';
import 'package:student_manage_app/Model/student_model.dart';
import 'package:student_manage_app/controllers/student_edit_provider.dart';
import 'package:student_manage_app/view/screens/Edit_data/widgets/editimage.dart';
import 'package:student_manage_app/view/screens/Student_adding/widgets/savebutton.dart';
import 'package:student_manage_app/view/screens/Student_adding/widgets/textfiled.dart';

class Editstudent extends StatelessWidget {
  final StudentModel studentModel;
  Editstudent({
    super.key,
    required this.studentModel,
  }) {}

  @override
  Widget build(BuildContext context) {
    StudentEditcontroller editprovider = Provider.of(context);
    Provider.of<StudentEditcontroller>(context, listen: false).initialValues(
        study: studentModel.study,
        name: studentModel.name,
        age: studentModel.age,
        imagePaths: studentModel.images,
        phone: studentModel.phone);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 206, 208),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit student',
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
              children: [EditImage()],
            ),
            SizedBox(
              height: 20,
            ),
            Namefield(
              namecontroller: editprovider.namecontroller,
            ),
            ClassField(
              classcontroller: editprovider.classcontroller,
            ),
            Agefield(
              agecontroller: editprovider.agecontroller,
            ),
            phonefield(
              phonecontroller: editprovider.phonecontroller,
            ),
            SizedBox(
              height: 20,
            ),
            SubmitButton(
              titletext: 'Update student',
              onTap: () async {
                StudentModel data = StudentModel(
                    name: editprovider.namecontroller.text,
                    age: editprovider.agecontroller.text,
                    study: editprovider.classcontroller.text,
                    images: editprovider.imagepath.toString(),
                    phone: editprovider.phonecontroller.text);
                await SQLHelper.updateData(studentModel.id!, data, context);
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

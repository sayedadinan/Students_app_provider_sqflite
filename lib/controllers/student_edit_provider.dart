import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class StudentEditcontroller extends ChangeNotifier {
  String imagepath = '';
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController classcontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  void initialValues({
    required String name,
    required String study,
    required String age,
    required String phone,
    required String imagePaths,
  }) {
    namecontroller.text = name;
    imagepath = imagePaths;
    classcontroller.text = study;
    agecontroller.text = age;
    phonecontroller.text = phone;
    notifyListeners();
  }

  editImage(String imagePath) {
    imagepath = imagePath;
    // notifyListeners();
  }
}

CircleAvatar images(images) {
  return CircleAvatar(
    backgroundImage: FileImage(File(images)),
    radius: 70,
  );
}

void editImage(ImageSource imageSource, BuildContext context) async {
  final editProvider = Provider.of<StudentEditcontroller>(context,
      listen:
          false); // Ensure to set listen to false if you don't want to rebuild UI immediately
  final selectedImage = await ImagePicker().pickImage(source: imageSource);
  if (selectedImage != null) {
    editProvider.editImage(selectedImage.path);
    print(selectedImage.path.toString());
  }
}

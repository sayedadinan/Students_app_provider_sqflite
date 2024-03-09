import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StudentEditcontroller extends GetxController {
  RxString imagepath = ''.obs;
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
    imagepath.value = imagePaths;
    classcontroller.text = study;
    agecontroller.text = age;
    phonecontroller.text = phone;
  }

  editImage(String imagePath) {
    imagepath.value = imagePath;
  }
}

CircleAvatar images(images) {
  return CircleAvatar(
    backgroundImage: FileImage(File(images)),
    radius: 70,
  );
}

void editImage(ImageSource imageSource) async {
  final selectedImage = await ImagePicker().pickImage(source: imageSource);
  if (selectedImage != null) {
    Editcontroller.editImage(selectedImage.path);
    print(selectedImage.path.toString());
  }
}

final StudentEditcontroller Editcontroller = Get.find();

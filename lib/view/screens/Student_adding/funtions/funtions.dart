import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_manage_app/controllers/student_adding.dart';

void getImage(ImageSource imageSource, BuildContext context) async {
  Studentaddcontrol addcontroller =
      Provider.of<Studentaddcontrol>(context, listen: false);
  final selectedImage = await ImagePicker().pickImage(source: imageSource);
  if (selectedImage != null) {
    addcontroller.addimage(selectedImage.path);
    print(selectedImage.path.toString());
  }
}

// void getImage(ImageSource imageSource, BuildContext context) async {
//   Studentaddcontrol addcontroller = Provider.of(context);
//   final selectedImage = await ImagePicker().pickImage(source: imageSource);
//   if (selectedImage != null) {
//     addcontroller.addimage(selectedImage.path);
//     print(selectedImage.path.toString());
//   }
// }

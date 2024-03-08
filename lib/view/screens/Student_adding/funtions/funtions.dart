import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_manage_app/controllers/student_adding.dart';

Studentaddcontrol addcontroller = Get.find();
void getImage(ImageSource imageSource) async {
  final selectedImage = await ImagePicker().pickImage(source: imageSource);
  if (selectedImage != null) {
    addcontroller.addimage(selectedImage.path);
    print(selectedImage.path.toString());
  }
}

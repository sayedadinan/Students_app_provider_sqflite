import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_manage_app/view/screens/Student_adding/funtions/funtions.dart';
// import 'package:student_manage_app/view/screens/Student_adding/funtions/funtions.dart';

// class Imagebox extends StatelessWidget {
//   const Imagebox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         const Positioned(
//             right: 70,
//             top: 100,
//             child: CircleAvatar(
//               radius: 20,
//               backgroundColor: Color.fromARGB(255, 10, 199, 251),
//             )),
//         Positioned(
//             right: 80,
//             top: 107,
//             child: IconButton(
//               onPressed: () {
//                 getImage(ImageSource.gallery);
//                 Navigator.of(context, rootNavigator: true).pop();
//               },
//               icon: Icon(Icons.camera_alt_rounded),
//             ))
//       ],
//     );
//   }
// }
class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      backgroundColor: Colors.cyan[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              width: 5,
                              color: const Color.fromARGB(255, 55, 135, 142))),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Camera', style: TextStyle()),
                              IconButton(
                                  onPressed: () {
                                    getImage(ImageSource.camera);
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 35,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              Text('Gallery', style: TextStyle()),
                              IconButton(
                                  onPressed: () {
                                    getImage(ImageSource.gallery);
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  icon: const Icon(
                                    Icons.photo_outlined,
                                    size: 35,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ));
          },
          child: Center(
            child: Obx(() {
              return Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 55, 135, 142)),
                child: addcontroller.imagepath.value.isEmpty
                    ? Image.asset(
                        'lib/assets/user for student.jpg',
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(
                          addcontroller.imagepath.value,
                        ),
                        fit: BoxFit.cover,
                      ),
              );
            }),
          ),
        ),
        const Positioned(
            right: 70,
            top: 100,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromARGB(255, 10, 199, 251),
            )),
        const Positioned(right: 80, top: 107, child: Icon(Icons.add_a_photo))
      ],
    );
  }
}

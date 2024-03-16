import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_manage_app/controllers/student_adding.dart';
import 'package:student_manage_app/view/screens/Student_adding/funtions/funtions.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Studentaddcontrol>(
      builder: (context, addcontroller, _) {
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
                        color: const Color.fromARGB(255, 55, 135, 142),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('Camera', style: TextStyle()),
                            IconButton(
                              onPressed: () {
                                getImage(ImageSource.camera, context);
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                size: 35,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Gallery', style: TextStyle()),
                            IconButton(
                              onPressed: () {
                                getImage(ImageSource.gallery, context);
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              icon: const Icon(
                                Icons.photo_outlined,
                                size: 35,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 55, 135, 142),
                ),
                child: addcontroller.imagepath.isEmpty
                    ? Image.asset(
                        'lib/assets/user for student.jpg',
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(addcontroller.imagepath),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const Positioned(
              right: 70,
              top: 100,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 10, 199, 251),
              ),
            ),
            const Positioned(
                right: 80, top: 107, child: Icon(Icons.add_a_photo)),
          ],
        );
      },
    );
  }
}

// class ImageContainer extends StatelessWidget {
//   const ImageContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Studentaddcontrol addcontroller =
//         Provider.of<Studentaddcontrol>(context, listen: false);

//     return Stack(
//       children: [
//         GestureDetector(
//             onTap: () {
//               showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                         backgroundColor: Colors.cyan[50],
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side: const BorderSide(
//                                 width: 5,
//                                 color:
//                                     const Color.fromARGB(255, 55, 135, 142))),
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Column(
//                               children: [
//                                 Text('Camera', style: TextStyle()),
//                                 IconButton(
//                                     onPressed: () {
//                                       getImage(ImageSource.camera, context);
//                                       Navigator.of(context, rootNavigator: true)
//                                           .pop();
//                                     },
//                                     icon: const Icon(
//                                       Icons.camera_alt_outlined,
//                                       size: 35,
//                                       color: Colors.black,
//                                     ))
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text('Gallery', style: TextStyle()),
//                                 IconButton(
//                                     onPressed: () {
//                                       print('gallery taken');
//                                       getImage(ImageSource.gallery, context);
//                                       Navigator.of(context, rootNavigator: true)
//                                           .pop();
//                                     },
//                                     icon: const Icon(
//                                       Icons.photo_outlined,
//                                       size: 35,
//                                       color: Colors.black,
//                                     ))
//                               ],
//                             ),
//                           ],
//                         ),
//                       ));
//             },
//             child: Container(
//               width: 160,
//               height: 160,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: const Color.fromARGB(255, 55, 135, 142)),
//               child: addcontroller.imagepath.isEmpty
//                   ? Image.asset(
//                       'lib/assets/user for student.jpg',
//                       fit: BoxFit.cover,
//                     )
//                   : Image.file(
//                       File(addcontroller.imagepath),
//                       fit: BoxFit.cover,
//                     ),
//             )),
//         const Positioned(
//             right: 70,
//             top: 100,
//             child: CircleAvatar(
//               radius: 20,
//               backgroundColor: Color.fromARGB(255, 10, 199, 251),
//             )),
//         const Positioned(right: 80, top: 107, child: Icon(Icons.add_a_photo))
//       ],
//     );
//   }
// }

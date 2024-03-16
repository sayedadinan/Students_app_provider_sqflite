import 'package:flutter/material.dart';
import 'package:student_manage_app/controllers/student_edit_provider.dart';
import 'package:student_manage_app/view/screens/student_details.dart/widgets/containers.dart';

class Detailspage extends StatelessWidget {
  final int id;
  final String name;
  final String study;
  final String age;
  final String phone;
  final String image;
  const Detailspage(
      {super.key,
      required this.id,
      required this.name,
      required this.study,
      required this.age,
      required this.phone,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 206, 208),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 108, 178, 185),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 39,
              ),
              images(image),
              SizedBox(
                width: 40,
              ),
              // Lottie.asset(
              //   'lib/assets/Animation - 1708963245059 (1).json',
              //   width: 90,
              // ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Card(
              color: Color.fromARGB(255, 108, 178, 185),
              elevation: 15,
              child: Container(
                width: double.maxFinite,
                height: 400,
                child: Column(
                  children: [
                    SizedBox(height: 45),
                    Namecontainer(name: name),
                    Agecontainer(age: age),
                    Classcontainer(study: study),
                    Phonecontainer(phone: phone)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

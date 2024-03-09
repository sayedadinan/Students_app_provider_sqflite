import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:student_manage_app/controllers/student_controller.dart';
import 'package:student_manage_app/view/screens/search_screen/widgets/search_result_tile.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    studentController.searchdata("");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 206, 208),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 108, 178, 185),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  studentController.searchdata(value);
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 55, 135, 142),
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  labelText: 'Search student',
                  hintText: 'search student name',
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
          ),
          Expanded(child: Obx(() {
            if (studentController.searchresultlist.isEmpty) {
              return Center(
                child: Text(
                  'No results found',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else {
              return Searchresult();
            }
          }))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_manage_app/controllers/student_provider.dart';
import 'package:student_manage_app/view/screens/search_screen/widgets/search_result_tile.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController studentprovider = Provider.of(context);
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
                  studentprovider.searchdata(value);
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
          Expanded(
              child: Expanded(
            child: studentprovider.searchresultlist.isEmpty
                ? Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Searchresult(),
          ))
        ],
      ),
    );
  }
}

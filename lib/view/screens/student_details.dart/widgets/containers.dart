import 'package:flutter/material.dart';

class Namecontainer extends StatelessWidget {
  final String name;
  const Namecontainer({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 300,
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Name  :',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class Agecontainer extends StatelessWidget {
  final String age;
  const Agecontainer({super.key, required this.age});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 300,
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Age     :',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              age,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class Classcontainer extends StatelessWidget {
  final String study;
  const Classcontainer({super.key, required this.study});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 300,
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Class   :',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              width: 18,
            ),
            Text(
              study,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class Phonecontainer extends StatelessWidget {
  final String phone;
  const Phonecontainer({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 300,
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Phone   :',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              width: 18,
            ),
            Text(
              phone,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

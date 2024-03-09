import 'package:flutter/material.dart';

class Customappbar extends PreferredSize {
  const Customappbar(
      {super.key, required super.preferredSize, required super.child});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Icon(Icons.menu),
      ),
      title: Text(
        'Student List',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 108, 178, 185),
    );
  }
}

import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String titletext;
  final Function()? onTap;

  const SubmitButton({super.key, required this.onTap, required this.titletext});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(22.5),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            titletext,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

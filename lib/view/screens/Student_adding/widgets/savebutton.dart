import 'package:flutter/material.dart';

// class Elevetedbutton extends StatelessWidget {
//   final Function()? ontap;
//   const Elevetedbutton({super.key, required this.ontap});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Color.fromARGB(255, 60, 138, 146),
//         padding: EdgeInsets.symmetric(
//             horizontal: 56.0, vertical: 22.0), // Adjust padding as needed
//       ),
//       child: Text(
//         'Save user',
//         style: TextStyle(color: Colors.white),
//       ),
//       onPressed: () {
//         print('worked');
//         ontap;
//       },
//     );
//   }
// }
// class Elevetedbutton extends StatelessWidget {
//   final VoidCallback? onTap;
//   const Elevetedbutton({Key? key, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Color.fromARGB(255, 60, 138, 146),
//         padding: EdgeInsets.symmetric(horizontal: 56.0, vertical: 22.0),
//       ),
//       child: Text(
//         'Save user',
//         style: TextStyle(color: Colors.white),
//       ),
//       onPressed: onTap,
//     );
//   }
// }
class SubmitButton extends StatelessWidget {
  final Function()? onTap;

  const SubmitButton({super.key, required this.onTap});

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
        child: const Center(
          child: Text(
            "Submit Data",
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

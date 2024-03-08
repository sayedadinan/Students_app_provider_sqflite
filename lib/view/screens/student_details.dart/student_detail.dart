import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 232, 232),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                maxRadius: 80,
              ),
              SizedBox(
                width: 40,
              ),
              Lottie.asset(
                'lib/assets/Animation - 1708963245059 (1).json',
                width: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

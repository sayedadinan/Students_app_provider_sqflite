import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_manage_app/controllers/student_adding.dart';
import 'package:student_manage_app/controllers/student_provider.dart';
import 'package:student_manage_app/controllers/student_edit_provider.dart';
import 'package:student_manage_app/view/screens/Home_screen/home_screen.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Studentaddcontrol()),
    ChangeNotifierProvider(create: (context) => StudentController()),
    ChangeNotifierProvider(create: (context) => StudentEditcontroller())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const Homescreen(),
    );
  }
}

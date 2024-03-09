import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
import 'package:student_manage_app/Model/student_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:student_manage_app/controllers/student_controller.dart';
// class Studentdatacntrl extends GetxController {
//   Database? database;
//   RxList<StudentModel> studentdata = <StudentModel>[].obs;

//   Future<dynamic> initDb() async {
//     database = await openDatabase(
//       'studentDb',
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute(
// 'CREATE TABLE user(id INTEGER PRIMARY KEY,  name TEXT, study TEXT, age TEXT, phone TEXT,selectedImage TEXT)',
//         );
//       },
//     );
//   }

//   addstudent(StudentModel data) async {
//     print('reached');
//     await database!.rawInsert(
//         'INSERT INTO user(name,study,age,phone,selectedImage)VALUES(?,?,?,?,?)',
//         [data.name, data.study, data.age, data.phone, data.images]);
//     print('data added');
//   }

//   get() async {
//     final result = await database!.rawQuery('SELECT * FROM user');
//     studentdata.clear();
//     for (var data in result) {
//       final student = StudentModel.fromMap(data);
//       studentdata.add(student);
//     }
//   }
// }
// class Studentdatacntrl extends GetxController {
//   Database? database;
//   RxList<StudentModel> studentdata = <StudentModel>[].obs;

//   Future<void> initDb() async {
//     try {
//       database = await openDatabase(
//         'studentDb',
//         version: 1,
//         onCreate: (db, version) async {
//           await db.execute(
// 'CREATE TABLE user(id INTEGER PRIMARY KEY,  name TEXT, study TEXT, age TEXT, phone TEXT,selectedImage TEXT)',
//           );
//         },
//       );
//     } catch (e) {
//       print('Error initializing database: $e');
//     }
//   }

//   Future<void> addstudent(StudentModel data) async {
//     final db = Studentdatacntrl().initDb();
//     try {
//       print('reached');
//       await db
//           .

//           // await db.rawInsert(
//           //   'INSERT INTO user(name,study,age,phone,selectedImage)VALUES(?,?,?,?,?)',
//           //   [data.name, data.study, data.age, data.phone, data.images],
//           // );
//           print('data added');
//     } catch (e) {
//       print('Error adding student: $e');
//     }
//   }

//   Future<void> getData() async {
//     try {
//       final result = await database!.rawQuery('SELECT * FROM user');
//       studentdata.clear();
//       for (var data in result) {
//         final student = StudentModel.fromMap(data);
//         studentdata.add(student);
//       }
//     } catch (e) {
//       print('Error getting data: $e');
//     }
//   }
// }
class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY,  name TEXT, study TEXT, age TEXT, phone TEXT,selectedImage TEXT)');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "data.db",
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> insertdata(StudentModel studentModel) async {
    final db = await SQLHelper.db();
    final data = {
      "name": studentModel.name,
      'study': studentModel.study,
      "age": studentModel.age,
      "phone": studentModel.phone,
      "selectedImage": studentModel.images,
    };
    final id = await db.insert("user", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    Get.find<StudentController>().fetchStudents();
    print(id);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    print('worked');
    final db = await SQLHelper.db();
    return db.query("user", orderBy: "id");
  }

  static Future<int> updateData(int id, StudentModel studentModel) async {
    print('successfully edited');
    final db = await SQLHelper.db();
    final data = {
      "name": studentModel.name,
      'study': studentModel.study,
      "age": studentModel.age,
      "phone": studentModel.phone,
      "selectedImage": studentModel.images,
    };
    final result =
        await db.update("user", data, where: "id=?", whereArgs: [id]);
    print('updated data $result');
    Get.find<StudentController>().fetchStudents();
    return result;
  }

  static Future<void> deleteData(int id) async {
    final db = await SQLHelper.db();
    db.delete("user", where: "id=?", whereArgs: [id]);
    Get.find<StudentController>().fetchStudents();
  }
}

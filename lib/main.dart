import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';
import 'package:bookshouse/screens/admin_pages/a_home/home.dart';
import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';
import 'package:bookshouse/screens/authorization/login.dart';
import 'package:bookshouse/screens/splash/splash_screen.dart';
import 'package:bookshouse/screens/user_pages/u_display/allBooks.dart';
import 'package:bookshouse/screens/user_pages/u_display/savedBooks.dart';
import 'package:bookshouse/screens/user_pages/u_home/home.dart';
import 'package:bookshouse/screens/user_pages/u_home/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'constants.dart';
import 'dart:async';
import 'package:bookshouse/sqldb.dart';

void main() async {
  // Initialize the databaseFactory
  //يتفادا الاخطاء من هذه العملية
  //WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  print("سوبرمااااااااااااااااااااااااااان");

  //WidgetsFlutterBinding.ensureInitialized();

  //Database database = await SqlDb().intialDb();
  //intialDb
  final db = await SqlDb.db();
  SqlDb.createTables(db);
  print("سبيدرمااااااااااااااااااان");
  SqlDb.db();
  print("باتمااااااااااااااااااان");
  final dataAuthors = await SqlDb.getItemsAuthor();
  addAuthor.authors = dataAuthors;
  print(addAuthor.authors);
  final databooks = await SqlDb.getItemsBook();
  addBook2.books = databooks;
print(addBook2.books);
  //doThing();
  // print("hi                    ${Author.MyAuthor[0].authorNameb}");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // routes: {
      //   'logInScreen': (context) => const LogIn(),
      //   'userScreen': (context) => const UserHomePage(),
      //   'auth': (context) => const Auth(),
      //   'adminScreen': (context) => AdminHomePage()
      // },
    );
  }
}

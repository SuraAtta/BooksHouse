import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';
import 'package:flutter/material.dart';
import 'package:bookshouse/constants.dart';
import 'package:get/get.dart';
import '../../splash/splash_screen.dart';
import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Admin Pages",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
            ),
            accountEmail: Text(emailName),
            decoration:const BoxDecoration(color: AppTheme.green),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book_rounded),
            title:const Text("Add Books"),
            onTap: () {
              Get.to(addBook2());
            },
          ),
          ListTile(
            leading:const Icon(Icons.person_add_alt_sharp),
            title:const Text("Add Author"),
            onTap: () {
              Get.to(addAuthor());
            },
          ),
          ListTile(
            leading:const Icon(Icons.logout),
            title:const Text("log out"),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Splash()))
            },
          ),
        ],
      ),
    );
  }
}

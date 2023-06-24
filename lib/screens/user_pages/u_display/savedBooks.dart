import 'package:bookshouse/constants.dart';
import 'package:bookshouse/screens/user_pages/u_details/authorDetails.dart';
import 'package:bookshouse/screens/user_pages/u_home/home.dart';
import 'package:flutter/material.dart';

import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';

class savedBooks extends StatefulWidget {
  const savedBooks({super.key});

  @override
  State<savedBooks> createState() => _savedBooksState();
}

class _savedBooksState extends State<savedBooks> {
  List<Map<String, dynamic>> books =
  addBook2.books.where((item) => item['isSaved'] == "yes").toList();
String auther_name="";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserHomePage(),
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const titleText(text: "Saved Books"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: size.height * 0.8,
                child: books.isEmpty
                    ?  Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      const Text("save some books!",
                          style: TextStyle(
                              color: AppTheme.darkGray,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal)),
                      const Center(
                        child: Icon(
                          Icons.add,
                          size: 70,
                          color: AppTheme.darkGray,
                        ),
                      ),
                    ],
                  ),
                )
                    :  ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, Index) {
                    return bookCard(
                      size: size,
                      image: addBook2.books[Index]['book_image'],
                      bookName: addBook2.books[Index]['book_name'],
                      authorName: "2",
                      price: addBook2.books[Index]['price'],
                      description: addBook2.books[Index]['description'],
                      category: addBook2.books[Index]['category'],
                      trind: addBook2.books[Index]['trind'],
                      isSaved: addBook2.books[Index]['isSaved'],
                      isInCard: addBook2.books[Index]['isInCard'], id: addBook2.books[Index]['book_id'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
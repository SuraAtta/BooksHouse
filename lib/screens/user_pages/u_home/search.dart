import 'package:bookshouse/constants.dart';
import 'package:bookshouse/screens/admin_pages/a_home/del_edit/del_edit.dart';
import 'package:bookshouse/screens/user_pages/u_details/bookDetails.dart';
import 'package:bookshouse/screens/user_pages/u_home/home.dart';
import 'package:flutter/material.dart';
import 'package:bookshouse/screens/user_pages/u_details/authorDetails.dart';
import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';
import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController? _textEditingController = TextEditingController();
  List<Map<String, dynamic>> booksOnSearch = [];
  String auther_name="";
  List<Map<String, dynamic>> books = addBook2.books.toList();
  @override
  Widget build(BuildContext context) {
    final Books b;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          onChanged: (value) {
            setState(() {
              setState(() {
                booksOnSearch = addBook2.books.where((element) =>
                    element['book_name'].toLowerCase().contains(value)).toList();
              });
            });
          },
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.green),
            ),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: AppTheme.green,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: _textEditingController!.text.isEmpty && booksOnSearch.isEmpty
              ? ListView.builder(
                  itemCount: booksOnSearch.length,
                  itemBuilder: (context, Index) {
                    for(int i=0;i<addAuthor.authors.length;i++){
                      if(addAuthor.authors[i]['author_id']==addBook2.books[Index]['author_id']) {
                        auther_name=addAuthor.authors[i]['author_name'];
                      }
                    }
                    return bookCard(
                      size: size,
                      image: addBook2.books[Index]['book_image'],
                      bookName: addBook2.books[Index]['book_name'],
                      authorName: auther_name,
                      price: addBook2.books[Index]['price'],
                      description: addBook2.books[Index]['book_name'],
                      category: addBook2.books[Index]['category'],
                      trind: addBook2.books[Index]['trind'],
                      id: addBook2.books[Index]['book_id'],
                      isInCard: addBook2.books[Index]['isInCard'] ,
                      isSaved:  addBook2.books[Index]['isSaved'],
                    );
                  },
                )
              : _textEditingController!.text.isNotEmpty && booksOnSearch.isEmpty
                  ? const Center(
                      child: Icon(
                        Icons.search_off,
                        size: 70,
                        color: AppTheme.darkGray,
                      ),
                    )
                  : _textEditingController!.text.isNotEmpty &&
                          booksOnSearch.isNotEmpty
                      ? ListView.builder(
                          itemCount: booksOnSearch.length,
                          itemBuilder: (context, Index) {
                            for(int i=0;i<addAuthor.authors.length;i++){
                              if(addAuthor.authors[i]['author_id']==addBook2.books[Index]['author_id']) {
                                auther_name=addAuthor.authors[i]['author_name'];
                              }
                            }
                            return bookCard(
                              size: size,
                              image: booksOnSearch[Index]['book_image'],
                              bookName: booksOnSearch[Index]['book_name'],
                              authorName: "2",
                              price: booksOnSearch[Index]['price'],
                              description:booksOnSearch[Index]['book_name'],
                              category: booksOnSearch[Index]['category'],
                              trind: booksOnSearch[Index]['trind'],
                              isSaved:booksOnSearch[Index]['isSaved'],
                              isInCard: booksOnSearch[Index]['isInCard'],
                              id:booksOnSearch[Index]['book_id'],
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: addBook2.books.length,
                          itemBuilder: (context, Index) {
                            for(int i=0;i<addAuthor.authors.length;i++){
                              if(addAuthor.authors[i]['author_id']==addBook2.books[Index]['author_id']) {
                                auther_name=addAuthor.authors[i]['author_name'];
                              }
                            }
                            return bookCard(
                                size: size,
                                image: addBook2.books[Index]['book_image'],
                                bookName: addBook2.books[Index]['book_name'],
                                authorName: "2",
                                price: addBook2.books[Index]['price'],
                                description: addBook2.books[Index]['book_name'],
                                category: addBook2.books[Index]['category'],
                                trind: addBook2.books[Index]['trind'],
                                isSaved: addBook2.books[Index]['isSaved'],
                                isInCard: addBook2.books[Index]['isInCard'],
                                id: addBook2.books[Index]['book_id']);
                          },
                        )),
    );
  }
}

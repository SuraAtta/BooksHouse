import 'package:bookshouse/constants.dart';
import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';
import 'package:bookshouse/screens/admin_pages/a_home/del_edit/del_edit.dart';
import 'package:bookshouse/screens/admin_pages/a_home/navBar.dart';
import 'package:bookshouse/screens/admin_pages/a_home/search.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import '../a_categories/addAuthors.dart';
import 'screens/admin_pages/a_categories/addBooks.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  String name="";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        //leading: Icon(Icons.arrow_back_ios_new),
        backgroundColor: Colors.transparent,
      ),
      drawer: drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: size.height * 0.3 - searchHeight / 2,
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Colors.black,
                    ),
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        "images/p1.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  /////////////////////////////////
                  Positioned(
                    top: size.height * 0.1,
                    left: kDefaultPadding,
                    child: const Text(
                      "Hi Admin",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(admidSearch());
                      },
                      child: Container(
                        height: searchHeight,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        decoration: BoxDecoration(
                          color: AppTheme.defaultColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              color: AppTheme.shadow,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Search",
                              style: TextStyle(
                                  color: AppTheme.darkGray,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: SizedBox(
                height: size.height * 0.7,
                child: ListView.builder(
                  itemCount: addBook2.books.length,
                  itemBuilder: (context, Index) {
                    for(int i=0;i<addAuthor.authors.length;i++){
                      if(addAuthor.authors[i]['author_id']==addBook2.books[Index]['author_id']) {
                         name=addAuthor.authors[i]['author_name'];
                      }
                    }
                    return bookCard(
                      book_id:addBook2.books[Index]['book_id'] ,
                      size: size,
                      image: addBook2.books[Index]['book_image'],
                      bookName: addBook2.books[Index]['book_name'],
                      authorName: name,
                      price: addBook2.books[Index]['price'],
                      description: addBook2.books[Index]['description'],
                      category: addBook2.books[Index]['category'],
                      trind: addBook2.books[Index]['trind'],
                      isSaved: addBook2.books[Index]['isSaved'],
                      isInCard: addBook2.books[Index]['isInCard'],
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

class bookCard extends StatelessWidget {
  const bookCard({
    Key? key,
    required this.book_id,
    required this.size,
    required this.image,
    required this.bookName,
    required this.authorName,
    required this.price,
    required this.description,
    required this.category,
    required this.trind,
    required this.isSaved,
    required this.isInCard,
  }) : super(key: key);
  final int book_id;
  final Size size;
  final String image;
  final String bookName;
  final String authorName;
  final String price;
  final String description;
  final String category;
  final String trind;
  final String isSaved;
  final String isInCard;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(delEdit(
          book_id: book_id,
          size: size,
          authorName: authorName,
          bookName: bookName,
          category: category,
          description: description,
          image: image,
          price: price,
          trind: trind,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
        child: Container(
          height: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 105,
                height: 160,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: 115,
                    height: 160,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.5,
                height: 160,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal),
                      textAlign: TextAlign.justify,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "$price ID",
                      style: const TextStyle(
                        color: AppTheme.green,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        color: AppTheme.darkGray,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.more_horiz

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

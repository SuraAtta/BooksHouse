import 'package:bookshouse/constants.dart';
import 'package:bookshouse/screens/user_pages/u_details/authorDetails.dart';
import 'package:flutter/material.dart';
import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';
import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';
class allBooks extends StatefulWidget {
  const allBooks({super.key});

  @override
  State<allBooks> createState() => _allBooksState();
}

class _allBooksState extends State<allBooks> {
  PageController control = PageController();
  int page = 0;
  /////////
  List<Map<String, dynamic>> historical =
      addBook2.books.where((item) => item['category'] == "historical").toList();
  List<Map<String, dynamic>> romantic =
      addBook2.books.where((item) => item['category'] == "romantic").toList();
  List<Map<String, dynamic>> fantasy =
      addBook2.books.where((item) => item['category'] == "fantasy").toList();
  List<Map<String, dynamic>> police =
      addBook2.books.where((item) => item['category'] == "police").toList();
  List<Map<String, dynamic>> realistic =
      addBook2.books.where((item) => item['category'] == "realistic").toList();
  String auther_name="";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextButton(
                              onPressed: () {
                                control.animateToPage(0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(page == 0
                                          ? AppTheme.green
                                          : AppTheme.buttonText),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: const BorderSide(
                                              color: AppTheme.borderColor)))),
                              child: Text(
                                "Historical",
                                style: TextStyle(
                                  color: page == 0
                                      ? AppTheme.buttonText
                                      : AppTheme.textColor,
                                  fontSize: page == 0 ? 15 : 12,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextButton(
                                onPressed: () {
                                  control.animateToPage(1,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);

                                  print(control.offset);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            page == 1
                                                ? AppTheme.green
                                                : AppTheme.buttonText),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: const BorderSide(
                                                color: AppTheme.borderColor)))),
                                child: Text(
                                  "Romantic",
                                  style: TextStyle(
                                    color: page == 1
                                        ? AppTheme.buttonText
                                        : AppTheme.textColor,
                                    fontSize: page == 1 ? 15 : 12,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextButton(
                                onPressed: () {
                                  control.animateToPage(2,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            page == 2
                                                ? AppTheme.green
                                                : AppTheme.buttonText),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: const BorderSide(
                                                color: AppTheme.borderColor)))),
                                child: Text(
                                  "Fantasy",
                                  style: TextStyle(
                                    color: page == 2
                                        ? AppTheme.buttonText
                                        : AppTheme.textColor,
                                    fontSize: page == 2 ? 15 : 12,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextButton(
                                onPressed: () {
                                  control.animateToPage(3,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            page == 3
                                                ? AppTheme.green
                                                : AppTheme.buttonText),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: const BorderSide(
                                                color: AppTheme.borderColor)))),
                                child: Text(
                                  "Police",
                                  style: TextStyle(
                                    color: page == 3
                                        ? AppTheme.buttonText
                                        : AppTheme.textColor,
                                    fontSize: page == 3 ? 15 : 12,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextButton(
                              onPressed: () {
                                control.animateToPage(4,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(page == 4
                                          ? AppTheme.green
                                          : AppTheme.buttonText),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: const BorderSide(
                                              color: AppTheme.borderColor)))),
                              child: Text(
                                "Realistic",
                                style: TextStyle(
                                  color: page == 4
                                      ? AppTheme.buttonText
                                      : AppTheme.textColor,
                                  fontSize: page == 4 ? 15 : 12,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: PageView(
                  controller: control,
                  onPageChanged: (value) {
                    setState(() {
                      page = value;
                    });
                  },
                  children: [
                    SizedBox(
                      height: size.height * 0.8,
                      child: ListView.builder(
                        controller: ScrollController(),
                        itemCount: historical.length,
                        itemBuilder: (context, Index) {
                          return bookCard(
                            size: size,
                            image: historical[Index]['book_image'],
                            bookName: historical[Index]['book_name'],
                            authorName: "2",
                            price: historical[Index]['price'],
                            description: historical[Index]['book_name'],
                            category:historical[Index]['category'],
                            trind:historical[Index]['trind'],
                            isSaved: historical[Index]['isSaved'],
                            isInCard: historical[Index]['isInCard'],
                              id: historical[Index]['book_id']
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.8,
                      child: ListView.builder(
                        itemCount: romantic.length,
                        itemBuilder: (context, Index) {
                          for(int i=0;i<addAuthor.authors.length;i++){
                            if(addAuthor.authors[i]['author_id']==addBook2.books[Index]['author_id']) {
                              auther_name=addAuthor.authors[i]['author_name'];
                            }
                          }
                          return bookCard(
                            size: size,
                            image:romantic[Index]['book_image'],
                            bookName: romantic[Index]['book_name'],
                            authorName: "2",
                            price: romantic[Index]['price'],
                            description: romantic[Index]['book_name'],
                            category: romantic[Index]['category'],
                            trind: romantic[Index]['trind'],
                            isSaved:romantic[Index]['isSaved'],
                            isInCard: romantic[Index]['isInCard'],
                              id: romantic[Index]['book_id']
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.8,
                      child: ListView.builder(
                        itemCount: fantasy.length,
                        itemBuilder: (context, Index) {
                          return bookCard(
                            size: size,
                            image: fantasy[Index]['book_image'],
                            bookName: fantasy[Index]['book_name'],
                            authorName: "2",
                            price:fantasy[Index]['price'],
                            description:fantasy[Index]['book_name'],
                            category:fantasy[Index]['category'],
                            trind: fantasy[Index]['trind'],
                            isSaved:fantasy[Index]['isSaved'],
                            isInCard: fantasy[Index]['isInCard'],
                              id:fantasy[Index]['book_id']
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.8,
                      child: ListView.builder(
                        itemCount: police.length,
                        itemBuilder: (context, Index) {
                          return bookCard(
                            size: size,
                            image: police[Index]['book_image'],
                            bookName: police[Index]['book_name'],
                            authorName: "2",
                            price:police[Index]['price'],
                            description: police[Index]['book_name'],
                            category: police[Index]['category'],
                            trind: police[Index]['trind'],
                            isSaved: police[Index]['isSaved'],
                            isInCard:police[Index]['isInCard'],
                              id: police[Index]['book_id']
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.8,
                      child: ListView.builder(
                        itemCount: realistic.length,
                        itemBuilder: (context, Index) {
                          return bookCard(
                            size: size,
                            image: realistic[Index]['book_image'],
                            bookName: realistic[Index]['book_name'],
                            authorName: "2",
                            price:realistic[Index]['price'],
                            description:realistic[Index]['description'],
                            category: realistic[Index]['category'],
                            trind: realistic[Index]['trind'],
                            isSaved:realistic[Index]['isSaved'],
                            isInCard: realistic[Index]['isInCard'],
                              id: realistic[Index]['book_id']
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

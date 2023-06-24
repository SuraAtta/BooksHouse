import 'package:bookshouse/constants.dart';
import 'package:bookshouse/screens/user_pages/u_details/bookDetails.dart';
import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';
import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class authorDetails extends StatefulWidget {
  const authorDetails({
    Key? key,
    required this.imageUrl,
    required this.authorName,
    required this.description,
  }) : super(key: key);
  final String imageUrl, authorName, description;
  @override
  State<authorDetails> createState() => _authorDetailsState();
}

class _authorDetailsState extends State<authorDetails> {
  @override
  Widget build(BuildContext context) {
    String s = widget.authorName;
    String id="";
    for (int i = 0; i < addAuthor.authors.length; i++) {
      if (s == addBook2.books[i]['author_id']) {
        id = addBook2.books[i]['author_id'];
      }
    }
    List<Map<String, dynamic>> books = addBook2.books.where((item) => item['author_id'] ==id).toList();
    Size size = MediaQuery.of(context).size;
    final TextController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: size.width,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 0,
                  child: Container(
                    height: size.height * 0.5,
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
                        height: size.height * 0.5,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.5,
                  child: ListView(
                    children: [
                      Positioned(
                        top: size.height * 0.1,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          ///////////////////////غيرت ال radiuse
                          radius: imageH_W / 2 - 1,
                          child: ClipOval(
                            child: Image.network(
                              widget.imageUrl,
                              height: imageH_W,
                              width: imageH_W,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.authorName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppTheme.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: size.width * 0.9,
                            child: Text(
                              widget.description,
                              style: const TextStyle(
                                color: AppTheme.defaultColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: homeButtonHeight / 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: size.height * 0.5,
              //alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    const Text(
                      "All",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    SizedBox(
                      height: size.height * 0.8,
                      child: ListView.builder(
                        controller: ScrollController(),
                        itemCount: books.length,
                        itemBuilder: (context, Index) {
                          for(int i=0;i<addAuthor.authors.length;i++){
                            if(addAuthor.authors[i]['author_id']==addBook2.books[Index]['author_id']) {
                              s=addAuthor.authors[i]['author_name'];
                            }
                          }
                          return bookCard(
                            size: size,
                            image: books[Index]['book_image'].toString(),
                            bookName: addBook2.books[Index]['book_name'].toString(),
                            authorName: s,
                            price: addBook2.books[Index]['price'].toString(),
                            description: addBook2.books[Index]['description'].toString(),
                            category: addBook2.books[Index]['category'].toString(),
                            trind: addBook2.books[Index]['trind'].toString(),
                            isSaved: addBook2.books[Index]['isSaved'].toString(),
                            isInCard: addBook2.books[Index]['isInCard'].toString(),
                            id: addBook2.books[Index]['book_id'],
                          );
                        },
                      ),
                    ),

                  ],
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
    required this.id
  }) : super(key: key);

  final Size size;
  final int id;
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
        Get.to(bookDetails(id: id,));
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
                    isSaved =="yes" ? Icons.bookmark : Icons.bookmark_border,
                     color:
                         isSaved == "yes" ? AppTheme.green : AppTheme.textColor,
                    size: 25,
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

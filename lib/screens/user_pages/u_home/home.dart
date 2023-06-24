import 'package:bookshouse/constants.dart';
import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';
import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';
import 'package:bookshouse/screens/user_pages/u_cart/cart.dart';
import 'package:bookshouse/screens/user_pages/u_details/authorDetails.dart';
import 'package:bookshouse/screens/user_pages/u_display/allBooks.dart';
import 'package:bookshouse/screens/user_pages/u_display/savedBooks.dart';
import 'package:bookshouse/screens/user_pages/u_home/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../sqldb.dart';
import '../u_details/bookDetails.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List<Map<String, dynamic>> trbooks = addBook2.books.where((item) => item['trind'] == "yas").toList();
//هنا التجييك
  List<Map<String, dynamic>> authors = addAuthor.authors.toList();
  String auther_name="";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.FloatingActionButtonColor,
          child: const Icon(
            Icons.shopping_cart,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => cart(),
              ),
            );
          }),
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
                      "Hi Doha",
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
                        Get.to(Search());
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  top: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homeButton(
                    size: size,
                    icon: Icons.bookmark,
                    text: "Saved Books",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const savedBooks(),
                          ));
                      setState(() {});
                    },
                    iconColor: Colors.black,
                  ),
                  homeButton(
                    size: size,
                    icon: Icons.category,
                    text: "Categories",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const allBooks(),
                          ));
                      //setState(() {});
                    },
                    iconColor: Colors.black,
                  ),
                ],
              ),
            ),
            const titleText(text: "Tranding Books"),
            SizedBox(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trbooks.length,
                  itemBuilder: (context, index) {
                    for(int i=0;i<addAuthor.authors.length;i++){
                      if(addAuthor.authors[i]['author_id']==trbooks[index]['author_id']) {
                        auther_name=addAuthor.authors[i]['author_name'];
                      }
                    }
                    return trandingBook(
                      id: trbooks[index]['book_id'],
                        imageUrl: trbooks[index]['book_image'],
                        authorName: auther_name,
                        bookName: trbooks[index]['book_name'],
                        description: trbooks[index]['description'],
                        price: trbooks[index]['price']);
                  }),
            ),
            const titleText(text: "Authors"),
            SizedBox(
              height: 78,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: addAuthor.authors.length,
                itemBuilder: (context, index) {
                  return authorCart(
                      description: authors[index]['author_description'],
                  authorName: authors[index]['author_name'],
                      imageUrl: authors[index]['author_image'],);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class authorCart extends StatelessWidget {
  const authorCart({
    super.key,
    required this.description,
    required this.imageUrl,
    required this.authorName,
  });
  final String description, imageUrl, authorName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(authorDetails(
          imageUrl: imageUrl,
          authorName: authorName,
          description: description,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: 200,
          height: 75,
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
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 64 / 2,
                  child: ClipOval(
                    child: Image.network(
                      imageUrl,
                      height: 64,
                      width: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 120,
                child: Text(
                  authorName,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF06070D),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class trandingBook extends StatelessWidget {
  const trandingBook({
    Key? key,
    required this.imageUrl,
    required this.authorName,
    required this.bookName,
    required this.description,
    required this.price,
    required this.id,
  }) : super(key: key);
  final String imageUrl, authorName, bookName, description;
  final String price;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(bookDetails(
          id: id,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          height: 216,
          width: 125,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 160,
                width: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${kDefaultSpases} $authorName",
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${kDefaultSpases} $bookName",
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF06070D),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class titleText extends StatelessWidget {
  const titleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: kDefaultPadding + 10,
          left: kDefaultPadding,
          bottom: kDefaultPadding + 5),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
            color: AppTheme.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal),
      ),
    );
  }
}

class homeButton extends StatefulWidget {
  homeButton({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
    required this.onPress,
    required this.iconColor,
  }) : super(key: key);

  final Size size;
  final String text;
  final IconData icon;
  void Function() onPress;
  Color iconColor;

  @override
  State<homeButton> createState() => _homeButtonState();
}

class _homeButtonState extends State<homeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: homeButtonHeight,
      width: widget.size.width * 0.4,
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
      child: ElevatedButton.icon(
        label: Text(
          widget.text,
          style: const TextStyle(
            color: AppTheme.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        icon: Icon(
          widget.icon,
          color: widget.iconColor,
        ),
        style: ElevatedButton.styleFrom(
          primary: AppTheme.defaultColor, // Background color
        ),
        onPressed: widget.onPress,
      ),
    );
  }
}

import 'package:bookshouse/screens/user_pages/u_details/authorDetails.dart';
import 'package:bookshouse/screens/user_pages/u_home/home.dart';
import 'package:flutter/material.dart';
import 'package:bookshouse/constants.dart';
import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';
import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';
import 'package:url_launcher/url_launcher.dart';

String text = "the order is:\n";
String city = "", locationDetails = "", note = "";

class cart extends StatefulWidget {
  cart({super.key});
  static double price = 0;

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  final _phoneNumberController = TextEditingController();
  final _cityController = TextEditingController();
  final _locationDetailsController = TextEditingController();
  String auther_name="";

  Order() {
    print(cart.price);
    _sendWhatsAppMessage();
  }

  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
    _cityController.dispose();
    _locationDetailsController.dispose();
  }

  List<Map<String, dynamic>> inCardList =
  addBook2.books.where((item) => item['isInCard'] == 'yes').toList();
  void addation() {
    for (int i = 0; i < inCardList.length; i++) {
      cart.price = cart.price + int.parse(inCardList[i]['price']);
      text = text + "${inCardList[i]['book_name']}\n";
    }
  }

  //double price = 32;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    addation();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            cart.price=0;
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
                height: size.height * 0.5,
                child: addBook2.books.isNotEmpty
                    ? ListView.builder(
                        itemCount: inCardList.length,
                        itemBuilder: (context, Index) {
                          for(int i=0;i<addAuthor.authors.length;i++){
                            if(addAuthor.authors[i]['author_id']==addBook2.books[Index]['author_id']) {
                              auther_name=addAuthor.authors[i]['author_name'];
                            }
                          }
                          return bookCard(
                            size: size,
                            image: addBook2.books[Index]['book_image'].toString(),
                            bookName: addBook2.books[Index]['book_name'].toString(),
                            authorName: auther_name,
                            price: addBook2.books[Index]['price'].toString(),
                            description: addBook2.books[Index]['description'].toString(),
                            category: addBook2.books[Index]['category'].toString(),
                            trind: addBook2.books[Index]['trind'].toString(),
                            isSaved: addBook2.books[Index]['isSaved'].toString(),
                            isInCard: addBook2.books[Index]['isInCard'].toString(),
                              id: addBook2.books[Index]['book_id']
                          );
                        },
                      )
                    : Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.2,
                            ),
                            const Text("add some books",
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
                      )),
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const titleText(
                  text: "Your Information",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.defaultColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 6,
                          spreadRadius: 0,
                          color: AppTheme.shadow,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: _phoneNumberController,
                        onChanged: (value) => city = value,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "your city"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.defaultColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 6,
                          spreadRadius: 0,
                          color: AppTheme.shadow,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: _cityController,
                        onChanged: (value) => locationDetails = value,
                        //obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "More location details"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.defaultColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 6,
                          spreadRadius: 0,
                          color: AppTheme.shadow,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: _locationDetailsController,
                        onChanged: (value) => note = value,
                        //obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Note",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: GestureDetector(
                    onTap: Order,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.FloatingActionButtonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Order Now | ${cart.price} ID",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

String phoneNumber =
    '+96407813238464'; // Replace with the phone number want to send the message to
String message =
    "$text \ntotal price:${cart.price}\ncity:$city\nlocation Details:$locationDetails\nnote:$note"; // Replace with the message you want to send

void _sendWhatsAppMessage() async {
  String url = 'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Failed to launch WhatsApp: $url');
  }
}



import 'package:bookshouse/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';
import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';
import '../../../sqldb.dart';
import '../u_home/home.dart';

// ignore: camel_case_types
class bookDetails extends StatefulWidget {
  const bookDetails({
    Key? key, required this.id,
  }) : super(key: key);
final int id;
  @override
  State<bookDetails> createState() => _bookDetailsState();
}

class _bookDetailsState extends State<bookDetails> {
  String Categories = "Categories";
  int auther_id=0;
  String name="",price="",auther_name="",image="",category="",isSaved="",isInCard="",description="",trind="";
  void _refreshBook() async {
    final data = await SqlDb.getItemsBook();
    setState(() {
      addBook2.books = data;
    });
  }


    // update a book in the database
    Future<void> _updateItemBookToSave() async {
      await SqlDb.updateItem(
          widget.id,
          name,
          auther_id,
          image,
          category,
          price,
          description,
          trind,
          "yes",
          isInCard);
      _refreshBook();
    }
    // update a book in the database
    Future<void> _updateItemBookToNotSave() async {
      await SqlDb.updateItem(
          widget.id,
          name,
          auther_id,
          image,
          category,
          price,
          description,
          trind,
          "no",
          isInCard);
      _refreshBook();
    }

    Future<void> _updateItemBookInCard() async {
      await SqlDb.updateItem(
          widget.id,
          name,
          auther_id,
          image,
          category,
          price,
          description,
          trind,
          isSaved,
          "yes");
      _refreshBook();
    }

    Future<void> _updateItemBookNotInCard() async {
      await SqlDb.updateItem(
          widget.id,
          name,
          auther_id,
          image,
          category,
          price,
          description,
          trind,
          isSaved,
          "no");
      _refreshBook();
    }


  void _addToCartState() {
    setState(() {
    //  widget.b.isInCart = !widget.b.isInCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextController = TextEditingController();

    for(int i=0;i<addBook2.books.length;i++){
      if(addBook2.books[i]["book_id"]==widget.id){
        for(int j=0;j<addAuthor.authors.length;j++){
          if(addAuthor.authors[j]['author_id']==addBook2.books[i]['author_id']) {
            auther_name=addAuthor.authors[j]['author_name'];
          }
        }
        auther_id=addBook2.books[i]['author_id'];
        name=addBook2.books[i]['book_name'];
        price=addBook2.books[i]["price"];
        image=addBook2.books[i]["book_image"];
        category=addBook2.books[i]['category'];
        isInCard=addBook2.books[i]['isInCard'];
        isSaved=addBook2.books[i]['isSaved'];
        description=addBook2.books[i]['description'];
        trind =addBook2.books[i]['trind'];
      }
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: size.height * 0.9,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.black,
                ),
                height: size.height * 0.9 - homeButtonHeight / 2,
                width: size.width,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "images/p1.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: size.height * 0.9 - homeButtonHeight / 2,
                  ),
                ),
              ),
            ),
            ListView(
              children: [
                Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.2,
                  right: size.width * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: size.height * 0.4,
                      child: Image.network(
                        height: size.height * 0.4,
                        //width: size.width * 0.5,
                        image,
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.5,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        auther_name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppTheme.green,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                      Text(
                        "  ${price} \$        ${category}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppTheme.green,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width * 0.9,
                        child: Text(
                          description,
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
                        height: homeButtonHeight + 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: kDefaultPadding,
              right: kDefaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homeButton(
                    size: size,
                    icon: Icons.shopping_bag,
                    text: "Add to card",
                    onPress: () {
                      if(isInCard=="no"){
                        _updateItemBookInCard();
                      }
                      else{
                        _updateItemBookNotInCard();
                      }
                    },
                    iconColor: isInCard == "yes"
                        ? AppTheme.green
                        : Colors.black,
                  ),
                  homeButton(
                    size: size,
                    icon: Icons.bookmark,
                    text: "Saved",
                    onPress: () {
                      if(isSaved=="no"){
                        _updateItemBookToSave();
                      }
                      else{
                        _updateItemBookToNotSave();
                      }
                    },
                    iconColor:
                    isSaved=="yes" ? AppTheme.green
                        : Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

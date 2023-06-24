import 'package:bookshouse/screens/admin_pages/a_home/screens/admin_pages/a_categories/addBooks.dart';
import 'package:bookshouse/screens/user_pages/u_home/home.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:bookshouse/constants.dart';
import '../../../../../../sqldb.dart';
import 'package:bookshouse/screens/admin_pages/a_categories/addAuthors.dart';


class delEdit extends StatefulWidget {
  const delEdit(
      {super.key,
        required this.book_id,
      required this.size,
      required this.image,
      required this.bookName,
      required this.authorName,
      required this.price,
      required this.description,
      required this.category,
      required this.trind});
  final int book_id;
  final Size size;
  final String image;
  final String bookName;
  final String authorName;
  final String price;
  final String description;
  final String category;
  final String trind;

  @override
  State<delEdit> createState() => _delEditState();
}

class _delEditState extends State<delEdit> {
  final _bookNameController = TextEditingController();
  final _authorNameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _linkController = TextEditingController();
  final _trindController = TextEditingController();
  String? selectedValue ;
  int id=0;

  void _refreshBook() async {
    final data = await SqlDb.getItemsBook();
    setState(() {
      addBook2.books = data;
    });
  }

  // update a book in the database
  Future<void> _updateItemBook() async {
    await SqlDb.updateItem(
         widget.book_id,
        _bookNameController.text,
        1,
        _linkController.text,
        _categoryController.text,
        _priceController.text,
        _descriptionController.text,
        _trindController.text,
        "no",
        "no");
    _refreshBook();
  }

  List<String> itemsList = [
    "historical",
    "romantic",
    "fantasy",
    "police",
    "realistic"
  ];
  String selectedItem = "historical";
  List<String> trindList = [
    "yas",
    "no",
  ];
  String selectedTrindState = "no";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    _bookNameController.text = widget.bookName;
    _categoryController.text = widget.category;
    _descriptionController.text = widget.description;
    _linkController.text = widget.image;
    _priceController.text = widget.price;
    _trindController.text = widget.trind;
    _authorNameController.text = widget.authorName;
  }

  Widget build(BuildContext context) {

    return Scaffold(
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
        actions: <Widget>[
          IconButton(
              onPressed: () {
                SqlDb.deleteBook(widget.book_id);
                _refreshBook();
              },
              icon:const Icon(
                Icons.delete_forever,
                color: Colors.black,
                size: 30,
              )),
          const SizedBox(
            width: kDefaultPadding,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              const titleText(
                text: "Book Information",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    controller: _bookNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "book name",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:const BorderSide(color: AppTheme.green),
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  width: 340,
                  height: 60,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          const Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 30,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Padding(
                              padding:const EdgeInsets.only(top: 3),
                              child: Text(
                                widget.authorName,
                                textDirection: TextDirection.ltr,
                                style:const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      items: addAuthor.authors.map((item) => DropdownMenuItem<String>(
                        alignment: Alignment.centerRight,
                        value: item['author_name'],
                        child: Text(
                          textDirection: TextDirection.ltr,
                          ("  ${item['author_name']}    "),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                          for(int i=0;i<addAuthor.authors.length;i++){
                            if(addAuthor.authors[i]['author_name']==selectedValue) {
                              id=addAuthor.authors[i]['author_id'];
                            }
                          }
                          print(id);
                        });
                      },
                      value: selectedValue,
                      icon: const Icon(
                        Icons.list,
                      ),
                      iconSize: 24,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 200,
                      buttonPadding:
                      const EdgeInsets.only(left: 14, right: 20),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color:  Colors.white,
                      ),
                      buttonElevation: 0,
                      itemHeight: 40,
                      itemPadding:
                      const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 370,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(10),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(0, 0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:const [
                    Text("category",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("trind",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:const BorderSide(color: AppTheme.darkGray),
                            )),
                        value: selectedItem,
                        items: itemsList
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        onChanged: (value) => setState(() {
                          selectedItem != value;
                          _categoryController.text = value!;

                        }),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppTheme.darkGray),
                            )),
                        value: selectedTrindState,
                        items: trindList
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        onChanged: (value) => setState(() {
                          selectedTrindState != value;
                          _trindController.text = value!;

                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    controller: _priceController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "price",

                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppTheme.green),
                      ),
                      //prefixIcon: Icon(Icons.search),
                      //prefixIconColor: AppTheme.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    controller: _linkController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "image link",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppTheme.green),
                      ),
                      //prefixIcon: Icon(Icons.search),
                      //prefixIconColor: AppTheme.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Expanded(
                  child: TextField(
                    maxLines: 5,
                    onChanged: (value) {},
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "description",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:const BorderSide(color: AppTheme.green),
                      ),
                      //prefixIcon: Icon(Icons.search),
                      //prefixIconColor: AppTheme.green,
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
                  onTap: _updateItemBook,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.FloatingActionButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Update Book",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

import 'package:bookshouse/screens/user_pages/u_home/home.dart';
import 'package:bookshouse/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:bookshouse/constants.dart';

class addAuthor extends StatefulWidget {
  const addAuthor({super.key});
  static List<Map<String, dynamic>> authors = [];
  @override
  State<addAuthor> createState() => _addAuthorState();
}

class _addAuthorState extends State<addAuthor> {
  SqlDb sqlDb = SqlDb();
  //refrish to the list
  final _authorController = TextEditingController();
  final _imageController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _refreshAuthors() async {
    final data = await SqlDb.getItemsAuthor();
    setState(() {
      addAuthor.authors = data;
    });
  }

  void _emtyController() {
    _authorController.text = "";
    _imageController.text = "";
    _descriptionController.text = "";
  }

  // Insert a new game to the database
  Future<void> _addItemAuthor() async {
    await SqlDb.createItemAuthor(_authorController.text.toString(),
        _imageController.text, _descriptionController.text);
    _refreshAuthors();
    _emtyController();
  }



  @override
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const titleText(
                  text: "Authot Information",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      controller: _authorController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "author name",
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      controller: _imageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "image link",
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
                          borderSide: BorderSide(color: AppTheme.green),
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
                    onTap: _addItemAuthor,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.FloatingActionButtonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Add Author",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

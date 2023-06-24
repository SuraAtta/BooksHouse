import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

class SqlDb {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('CREATE TABLE author(author_id INTEGER PRIMARY KEY, author_name TEXT,author_image TEXT,author_description TEXT)');
    await database.execute('CREATE TABLE book(book_id INTEGER PRIMARY KEY, book_name TEXT,author_id INTEGER,book_image TEXT,category TEXT,description TEXT,price TEXT,trind TEXT,isSaved TEXT,isInCard TEXT)');

  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'doha7.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (book)
  static Future<int> createItemAuthor(
      String name, String image, String description) async {
    final db = await SqlDb.db();
    final data = {
      'author_name': name,
      'author_image': image,
      'author_description': description
    }; //columns
    final id = await db.insert('author', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createItemBook(String name, int author, String image,
      String category, String price, String description, String trind,String isSaved,String isInCard) async {
    final db = await SqlDb.db();
    final data = {
      'book_name': name,
      'author_id': author,
      'book_image': image,
      'category': category,
      'price': price,
      'description': description,
      'trind': trind,
      'isSaved' : isSaved,
      'isInCard' :isInCard
    }; //columns
    final id = await db.insert('book', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (books)
  static Future<List<Map<String, dynamic>>> getItemsBook() async {
    final db = await SqlDb.db();
    return db.query('book', orderBy: "book_id");
  }

  static Future<List<Map<String, dynamic>>> getItemsAuthor() async {
    final db = await SqlDb.db();
    return db.query('author', orderBy: "author_id");
  }

  static Future<int> updateItem(int book_id,String name, int author, String image,
      String category, String price, String description, String trind,String isSaved,String isInCard) async {
    final db = await SqlDb.db();

    final data = {
      'book_name': name,
      'author_id': author,
      'book_image': image,
      'category': category,
      'price': price,
      'description': description,
      'trind': trind,
      'isSaved' : isSaved,
      'isInCard' :isInCard
    };
    final result =
    await db.update('book', data, where: "book_id = ?", whereArgs: [book_id]);
    return result;
  }

  static Future<void> deleteBook(int id) async {
    final db = await SqlDb.db();
    try {
      await db.delete("book", where: "book_id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
  static Future<void> deleteAuter() async {
    final db = await SqlDb.db();
    try {
      await db.delete("author", where: "author_id = ?", whereArgs: [2]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}



import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color mainColor = Color(0xFF33ADF8);
  static const Color textColor = Colors.black;
  static const Color gray = Color(0xFFF1F1F1);
  static const Color borderColor = Color(0xFFC3BFBF);
  static const Color defaultColor = Colors.white;
  static const Color green = Color(0xFF38866A);
  static const Color shadow = Colors.black26;
  static const Color darkGray = Color(0xFF727372);

  static const Color buttonText = Colors.white;
  static const Color FloatingActionButtonColor = Color(0xFF355687);

}


String emailName = "";
const double kDefaultPadding = 20.0;
const double searchHeight = 46;
const double homeButtonHeight = 60;
const double imageH_W = 116;
const String kDefaultSpases = "  ";

class Books {
  String bookName, authorName, image, description;
  double price;
  bool isSaved;
  bool isInCart;
  String category;
  Books(String bookNameb, String authorNameb, double priceb, String imageb,
      String descriptionb, String categoryb,
      [bool? isSavedb, bool? isInCartb])
      : bookName = bookNameb,
        authorName = authorNameb,
        price = priceb,
        image = imageb,
        description = descriptionb,
        category = categoryb,
        isSaved = (isSavedb ?? false),
        isInCart = (isInCartb ?? false);

  static makeAsTrue(bool x) {
    x = !x;
  }

  static List<Books> MyBooks = <Books>[];

  static addBooks(String bookName, String authorNameb, String image,
      String description, double price, String category) {
    MyBooks.add(
        Books(bookName, authorNameb, price, image, description, category));
  }
}

class Author {
  String descriptionb, imageUrlb, authorNameb;
  Author(String description, String imageUrl, String authorName)
      : descriptionb = description,
        imageUrlb = imageUrl,
        authorNameb = authorName;

  static List<Author> MyAuthor = <Author>[];
  static addAuthor(
    String description,
    String imageUrl,
    String name,
  ) {
    MyAuthor.add(Author(description, imageUrl, name));
  }
}
//
// void doThing() {
//   Author.addAuthor(
//       "George Raymond Richard Martin is a science fiction, horror and fantasy novelist, short story writer, screenwriter and television producer, best known for the international best-selling A Song of Ice and Fire series of novels that was adapted into the HBO drama series Game of Thrones.",
//       "images/pa1.jpg",
//       "George R.R. Martin");
//   Author.addAuthor(
//       "Nellie Harper Lee is an American author known for her Pulitzer Prize-winning novel; To kill a mockingbird. In it, Harper Lee addresses the issue of racial segregation that she experienced as a child in her hometown of Monroeville, Alabama.",
//       "images/pa2.jpg",
//       "Harper Lee");
//   Books.addBooks(
//       "The Catcher in the Rye",
//       "Jerome David Salinger",
//       "images/p2.jpg",
//       "The events of this novel begin in the late 1950s, when the young sixteen-year-old Holden Caulfield was standing on a small hill in Aggerstown, Pennsylvania. He received a notice of expulsion from school for failing four out of the five subjects he was studying. The young man tells us the story of the two days after receiving this letter. This is just the story. A mere forty-eight hours in the life of a teenager who has been kicked out of school.",
//       3,
//       "realistic");
//   Books.addBooks(
//       "The Time Traveler's Wife",
//       "Audrey Niffenegger",
//       "images/p3.jpg",
//       " This unique and captivating novel tells the story of Henry DeTamble, a dashing and handsome librarian with a secret: he has a genetic disorder that causes him to time travel involuntarily. As he travels back and forth through time, he meets Clare Abshire, an artist, and they fall deeply in love. However, their relationship is complicated by Henry's unpredictable disappearances and reappearances, as Clare must navigate a life with a husband who is never truly present. Despite the challenges they face, Henry and Clare's love for each other transcends time itself, and they strive to find a way to make their relationship work against all odds. The Time Traveler's Wife is a heartwarming and poignant tale of love, fate, and the power of connection that will captivate readers with its unique blend of romance, science fiction, and literary fiction",
//       6.5,
//       "romantic");
//   Books.addBooks(
//       "The Nightingale",
//       "Kristin Hannah",
//       "images/p4.jpg",
//       "Set in France during World War II, this novel follows the story of two sisters, Vianne and Isabelle, who face extraordinary challenges as they resist the Nazi occupation in their own ways. It's a tale of bravery, sacrifice, and the power of love during a tumultuous period in history.",
//       6.5,
//       "historical");
//   Books.addBooks(
//       "The Pillars of the Earth",
//       "Ken Follett",
//       "images/p5.jpg",
//       "Set in 12th-century England, this epic historical novel tells the story of the building of a cathedral in the fictional town of Kingsbridge. Filled with political intrigue, religious conflicts, and complex characters, it's a gripping tale of ambition, power, and love in a time of upheaval.",
//       6.5,
//       "historical");
//   Books.addBooks(
//       "All the Light We Cannot See",
//       "Anthony Doerr",
//       "images/p6.jpg",
//       "Set during World War II, this Pulitzer Prize-winning novel weaves together the stories of a blind French girl named Marie-Laure and a young German boy named Werner. Their paths converge in occupied France, and their struggles to survive and find meaning in a war-torn world make for a moving and beautifully written tale.",
//       6.5,
//       "historical");
//   Books.addBooks(
//       "Wolf Hall",
//       "Hilary Mantel",
//       "images/p7.jpg",
//       "Set in 16th-century England, this historical fiction novel follows the rise of Thomas Cromwell, a commoner who becomes a trusted adviser to King Henry VIII. Full of political intrigue, religious conflicts, and courtly machinations, it offers a fresh perspective on a well-known period of history and is the first book in a trilogy that also includes Bring Up the Bodies and The Mirror and the Light.",
//       6.5,
//       "historical");
//   Books.addBooks(
//       "The Name of the Rose",
//       "Umberto Eco",
//       "images/p8.jpg",
//       "Set in 14th-century Italy, this historical mystery novel follows a Franciscan friar named William of Baskerville who arrives at an isolated monastery to investigate a series of mysterious deaths. As he delves into the secrets of the monastery, he encounters political intrigue, theological debates, and a complex web of secrets and lies. It's a thought-provoking and immersive read that combines historical fiction, philosophy, and mystery.",
//       6.5,
//       "historical");
//   Books.addBooks(
//       "The Lord of the Rings",
//       "J.R.R. Tolkien",
//       "images/p9.jpg",
//       "This classic epic fantasy trilogy is set in the fictional world of Middle-earth and follows the journey of a young hobbit named Frodo Baggins as he embarks on a quest to destroy a powerful ring that could bring about the end of the world. It's a tale of adventure, friendship, and the battle between good and evil.",
//       6.5,
//       "fantasy");
//   Books.addBooks(
//       "A Song of Ice and Fire",
//       "George R.R. Martin",
//       "images/p10.jpg",
//       "This popular fantasy series, also known as the Game of Thrones series, is set in the fictional continent of Westeros and follows the political intrigues, power struggles, and epic battles among noble families vying for control of the Iron Throne. It's a complex and gritty tale with richly drawn characters and a richly detailed world.",
//       6.5,
//       "fantasy");
//   Books.addBooks(
//       "The Name of the Wind",
//       "Patrick Rothfuss",
//       "images/p11.jpg",
//       "This critically acclaimed fantasy novel follows the life of Kvothe, a legendary magician, musician, and adventurer, as he recounts his life story to a chronicler. It's a beautifully written coming-of-age tale filled with magic, music, and mystery, and has a richly crafted world and a captivating narrative.",
//       6.5,
//       "fantasy");
//   Books.addBooks(
//       "The Stormlight Archive",
//       "Brandon Sanderson",
//       "images/p12.jpg",
//       "This epic fantasy series follows the story of a world plagued by eternal storms and a group of magical knights known as Radiants who possess powerful abilities. With intricate world-building, complex characters, and epic battles, it's a series that delves into themes of honor, duty, and the struggle between light and darkness.",
//       6.5,
//       "fantasy");
//   Books.addBooks(
//       "The Chronicles of Narnia",
//       "C.S. Lewis",
//       "images/p13.jpg",
//       "This beloved series of children's fantasy books transports readers to the magical land of Narnia, where talking animals, mythical creatures, and magical adventures abound. It's a timeless tale of adventure, courage, and the battle between good and evil, with allegorical elements that make it a classic for readers of all ages.",
//       6.5,
//       "fantasy");
//   Books.addBooks(
//       "To Kill a Mockingbird",
//       "Harper Lee",
//       "images/p14.jpg",
//       " This Pulitzer Prize-winning novel is a classic tale set in the American South during the 1930s. It follows the story of Scout Finch, a young girl, as she navigates issues of race, injustice, and morality in a small town. It's a poignant exploration of social issues and human nature, with memorable characters and a timeless message.",
//       6.5,
//       "realistic");
//   Books.addBooks(
//       "The Great Gatsby",
//       "F. Scott Fitzgerald",
//       "images/p15.jpg",
//       "Set in the 1920s during the Jazz Age in America, this classic novel tells the story of Jay Gatsby, a wealthy and enigmatic figure, through the eyes of narrator Nick Carraway. It's a beautifully written tale of love, disillusionment, and the pursuit of the American Dream, with a vivid depiction of the social and cultural climate of the time.",
//       6.5,
//       "realistic");
//   Books.addBooks(
//       "Little Fires Everywhere",
//       "Celeste Ng",
//       "images/p16.jpg",
//       "This contemporary novel explores the complexities of family, identity, and race in a suburban community in Ohio. It follows the intertwined lives of two families, the Richardsons and the Warrens, as their lives intersect and secrets unravel. It's a thought-provoking and beautifully written story that delves into the nuances of human relationships and the complexities of modern life.",
//       6.5,
//       "realistic");
//   Books.addBooks(
//       "The Help",
//       "Kathryn Stockett",
//       "images/p17.jpg",
//       "Set in Mississippi during the 1960s civil rights movement, this novel tells the story of African American maids and their relationships with their white employers. Through the perspectives of multiple characters, it explores issues of race, class, and discrimination, and the power dynamics in a deeply divided society. It's a compelling and powerful portrayal of a tumultuous time in American history.",
//       6.5,
//       "realistic");
//   Books.addBooks(
//       "The Nightingale",
//       "Kristin Hannah",
//       "images/p18.jpg",
//       "This historical fiction novel is set in France during World War II and follows the story of two sisters, Vianne and Isabelle, who face extraordinary challenges as they resist the Nazi occupation in their own ways. It's a gripping tale of bravery, sacrifice, and the power of love, with a vivid portrayal of the horrors of war and the strength of the human spirit.",
//       6.5,
//       "realistic");
//   Books.addBooks(
//       "The Girl with the Dragon Tattoo",
//       "Stieg Larsson",
//       "images/p19.jpg",
//       "This bestselling crime thriller features a journalist and a hacker who team up to solve a murder case involving a wealthy family, and delves into police procedural elements as they work with law enforcement to uncover the truth.",
//       6.5,
//       "police");
//   Books.addBooks(
//       "The Reversal",
//       "Michael Connelly",
//       "images/p20.jpg",
//       "This book is part of the Harry Bosch series, and follows the story of a retired LAPD detective who assists the police in solving a cold case while working as a private investigator. It provides an authentic portrayal of police work, with detailed investigative procedures and legal processes.",
//       6.5,
//       "police");
//   Books.addBooks(
//       "The Silence of the Lambs",
//       "Thomas Harris",
//       "images/p21.jpg",
//       "This psychological thriller features an FBI trainee who works with the police to catch a serial killer known as Buffalo Bill.It provides insight into the inner workings of the FBI's Behavioral Science Unit and their techniques for profiling criminals.",
//       6.5,
//       "police");
//   Books.addBooks(
//       "The No. 1 Ladies' Detective Agency",
//       "Alexander McCall Smith",
//       "images/p22.jpg",
//       " This is the first book in a cozy mystery series set in Botswana, featuring a female private detective who works with the local police to solve cases. It provides a unique perspective on police work in a different cultural context.",
//       6.5,
//       "police");
//   Books.addBooks(
//       "The Poet",
//       "Michael Connelly",
//       "images/p23.jpg",
//       "This crime novel follows a journalist who becomes involved in a case being investigated by the police, and delves into the challenges and complexities of law enforcement's pursuit of a serial killer. It provides an in-depth look at the intricacies of police investigations and the toll it takes on those involved.",
//       6.5,
//       "police");
// }

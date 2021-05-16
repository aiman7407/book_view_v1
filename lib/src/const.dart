import 'package:book_animation/models/book.dart';

const _bookAppAsset='assets/images';
final bookAppBackground='$_bookAppAsset/background.png';
List<Book> books=[
  Book(
      author: 'Robert Martin',
      img:'$_bookAppAsset/book1.jpg' ,
      title: 'Clean Code'
  ),
  Book(
      author: 'Robert Martin ',
      img:'$_bookAppAsset/book2.jpg' ,
      title: 'The Clean Coder:'
  ),

  Book(
      author: 'Clean Architecture',
      img:'$_bookAppAsset/book3.jpg' ,
      title: 'Robert Martin '
  ),
  Book(
      author: 'Gayle Laakmann McDowell ',
      img:'$_bookAppAsset/book4.jpg' ,
      title: 'Cracking the Coding Interview'
  ),

  Book(
      author: 'Aditya Bhargava',
      img:'$_bookAppAsset/book5.jpg' ,
      title: 'Grokking Algorithms'
  ),

];
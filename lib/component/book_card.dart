import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final bookHeight;

  final bookWidth;

  final fixRotation;
  final rotation;
  final book;

  BookCard(
      {this.bookHeight,
      this.bookWidth,
      this.fixRotation,
      this.rotation,
      this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Stack(
            children: [
              Container(
                height: bookHeight,
                width: bookWidth,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(5, 5),
                      spreadRadius: 10),
                ]),
              ),
              Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..rotateY(1.8 * fixRotation)
                    ..translate(
                        -rotation * MediaQuery.of(context).size.width * 0.8)
                    ..scale(1 + rotation),
                  child: Image.asset(
                    book.img,
                    fit: BoxFit.cover,
                    height: bookHeight,
                    width: bookWidth,
                  ))
            ],
          )),
          SizedBox(
            height: 90,
          ),
          Opacity(
            opacity: 1 - rotation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'By ${book.author}',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:book_animation/component/book_card.dart';
import 'package:book_animation/component/customized_appbar.dart';
import 'package:book_animation/src/const.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = PageController();
  final notifireScroll = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    final bookHeight = MediaQuery.of(context).size.height * 0.45;
    final bookWidth = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              '$bookAppBackground',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: kToolbarHeight, child: CustomAppbar()),
          ValueListenableBuilder<double>(
            valueListenable: notifireScroll,
            builder: (context, value, _) {
              return PageView.builder(
                  controller: _controller,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    final percentage = index - value;
                    final rotation = percentage.clamp(0.0, 1.0);
                    final fixRotation = pow(rotation, 0.35);

                    return BookCard(
                      rotation: rotation,
                      fixRotation: fixRotation,
                      book: book,
                      bookWidth: bookWidth,
                      bookHeight: bookHeight,
                    );
                  });
            },
          )
        ],
      ),
    );
  }

  listner() {
    notifireScroll.value = _controller.page;
  }

  @override
  void initState() {
    _controller.addListener(listner);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(listner);
    _controller.dispose();
    super.dispose();
  }
}

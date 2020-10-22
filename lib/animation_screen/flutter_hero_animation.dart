



import 'package:flutter/material.dart';

class HeroAnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.asset(
              'assets/images/image1.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
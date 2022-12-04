import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/appBar/custom_app_bar.dart';

class HeroAnimationScreen extends StatelessWidget {
  const HeroAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Hero Animation",
      ),
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

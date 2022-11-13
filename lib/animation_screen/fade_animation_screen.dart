import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/fade_animation.dart';
import 'package:flutter_animation/shared/resources/app_images.dart';

class FadeAnimationScreen extends StatelessWidget {
   FadeAnimationScreen({Key key}) : super(key: key);

  final List<String> items = [
     AppImages.ironMan,
     AppImages.avengers,
     AppImages.thor,
     AppImages.ironMan2,
     ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
          return FadeAnimation(
            double.parse((index+1).toString()),
            child: Image.asset(
              items[index],
            ),
          );
        }));
  }
}

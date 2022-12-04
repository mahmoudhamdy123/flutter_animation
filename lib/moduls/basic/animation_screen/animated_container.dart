import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/appBar/custom_app_bar.dart';

class AnimatedContainerScreen extends StatefulWidget {
  @override
  _AnimatedContainerScreenState createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Animated Container',
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              select = !select;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.bounceInOut,
            height: select ? 200 : 100,
            width: select ? 200 : 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

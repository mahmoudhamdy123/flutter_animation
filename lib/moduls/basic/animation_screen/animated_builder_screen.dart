import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/appBar/custom_app_bar.dart';

class AnimatedBuilderScreen extends StatefulWidget {
  @override
  _AnimatedBuilderScreenState createState() => _AnimatedBuilderScreenState();
}

class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen>
    with SingleTickerProviderStateMixin {
  bool select = true;
  late AnimationController _controller;
  late Animation<Size> _heightAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _heightAnimation =
        Tween<Size>(begin: Size(double.infinity, 100), end: Size(double.infinity, 200))
            .animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Animated Builder',
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (select) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            select = !select;
          },
          child: AnimatedBuilder(
            animation: _heightAnimation,
            builder: (ctx, child) => Container(
              height: _heightAnimation.value.height,
              width: _heightAnimation.value.height,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

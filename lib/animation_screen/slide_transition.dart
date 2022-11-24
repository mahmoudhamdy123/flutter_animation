import 'package:flutter/material.dart';



class SlideTransitionScreen extends StatefulWidget {
  SlideTransitionScreen({Key? key}) : super(key: key);

  @override
  _SlideTransitionScreenState createState() => _SlideTransitionScreenState();
}

class _SlideTransitionScreenState extends State<SlideTransitionScreen>
    with SingleTickerProviderStateMixin {

  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 0.0),
    ).animate(
        CurvedAnimation(
      parent: _controller!,
      curve: Curves.decelerate,
    ));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SlideTransition(
          position: _offsetAnimation!,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';



class TransitionOpacityScreen extends StatefulWidget {


  @override
  _TransitionOpacityScreenState createState() => _TransitionOpacityScreenState();
}

class _TransitionOpacityScreenState extends State<TransitionOpacityScreen>  with SingleTickerProviderStateMixin{
  Animation<double>? _opacityAnimation;
  AnimationController? _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))..repeat(reverse: true);
    _opacityAnimation =  CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    );
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
        child: FadeTransition(
          opacity: _opacityAnimation!,
          child: Container(
            width: 100,
            height: 100,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

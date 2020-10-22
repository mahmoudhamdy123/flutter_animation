import 'package:flutter/material.dart';



class AnimatedContainerScreen extends StatefulWidget {

  @override
  _AnimatedContainerScreenState createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {

  bool select = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              select = !select;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: Curves.bounceInOut,
            height: select?200:100,
            width: select?200:100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

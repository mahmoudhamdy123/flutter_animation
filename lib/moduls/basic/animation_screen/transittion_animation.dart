import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/appBar/custom_app_bar.dart';
import 'package:flutter_animation/shared/components/content_information_widget.dart';
import 'package:flutter_animation/shared/components/image/image_information_widget.dart';

class TransitionAnimationScreen extends StatefulWidget {
  const TransitionAnimationScreen({Key? key}) : super(key: key);

  @override
  State<TransitionAnimationScreen> createState() => _TransitionAnimationScreenState();
}

class _TransitionAnimationScreenState extends State<TransitionAnimationScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: CustomAppBar(
        title: "Transition Animation",
      ),
      body: Stack(alignment: Alignment.center, children: <Widget>[
        AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 40 : 100,
            width: isExpanded ? size.width * 0.78 : size.width * 0.7,
            height: isExpanded ? size.height * 0.6 : size.height * 0.5,
            child: const ContentInformationWidget()),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: isExpanded ? 150 : 100,
          child: GestureDetector(
            onPanUpdate: (DragUpdateDetails value) {
              if (value.delta.dy < 0) {
                setState(() {
                  isExpanded = true;
                });
              } else if (value.delta.dy > 0) {
                setState(() {
                  isExpanded = false;
                });
              }
            },
            onTap: () {},
            child: const ImageInformationWidget(),
          ),
        ),
      ]),
    );
  }
}

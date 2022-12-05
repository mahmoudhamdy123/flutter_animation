import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/appBar/custom_app_bar.dart';

class AnimatedPositionedScreen extends StatefulWidget {
  const AnimatedPositionedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionedScreen> createState() => _AnimatedPositionedScreenState();
}

class _AnimatedPositionedScreenState extends State<AnimatedPositionedScreen>
    with TickerProviderStateMixin {
  double heightBottom = 100;
  bool openBottom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Animated Positioned",
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: openBottom ? constraints.maxHeight - heightBottom : heightBottom,
              left: 0,
              right: 0,
              height: openBottom ? heightBottom : constraints.maxHeight - heightBottom,
              child: Container(
                color: Colors.green,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: 0,
              left: 0,
              right: 0,
              height: openBottom ? constraints.maxHeight - heightBottom : heightBottom,
              child: GestureDetector(
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  if (details.primaryDelta! < 0) {
                    openBottom = true;
                  } else {
                    openBottom = false;
                  }
                  setState(() {});
                },
                child: Container(
                  color: Colors.red,
                  height: heightBottom,
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

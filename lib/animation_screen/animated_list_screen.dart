import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/custom_animated_list_widget.dart';

class AnimatedListScreen extends StatelessWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
      ),
      body: const CustomAnimatedLisWidget(),
    );
  }
}

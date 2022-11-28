import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/custom_animated_dynamic_list_widget.dart';
import 'package:flutter_animation/shared/components/custom_app_bar.dart';

class AnimatedDynamicListScreen extends StatelessWidget {
  const AnimatedDynamicListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Animated Dynamic List',
      ),
      body: const CustomAnimatedDynamicLisWidget(),
    );
  }
}

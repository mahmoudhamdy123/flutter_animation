import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/custom_app_bar.dart';

class TransitionOpacityScreen extends StatefulWidget {
  const TransitionOpacityScreen({super.key});

  @override
  _TransitionOpacityScreenState createState() => _TransitionOpacityScreenState();
}

class _TransitionOpacityScreenState extends State<TransitionOpacityScreen>
    with SingleTickerProviderStateMixin {
  Animation<double>? _opacityAnimation;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
      ..repeat(reverse: true);
    _opacityAnimation = CurvedAnimation(
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
      appBar: CustomAppBar(
        title: "Transition Opacity",
      ),
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation!,
          child: const SizedBox(
            width: 100,
            height: 100,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

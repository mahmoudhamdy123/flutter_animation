import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/custom_app_bar.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeScreen> createState() => _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Animated Cross Fade',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
                firstChild: const Text("Hello, Mahmoud"),
                secondChild: const Text("Second Child"),
                crossFadeState: crossFadeState,
                duration: const Duration(milliseconds: 500)),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (crossFadeState == CrossFadeState.showFirst) {
                    crossFadeState = CrossFadeState.showSecond;
                  } else {
                    crossFadeState = CrossFadeState.showFirst;
                  }
                  setState(() {});
                },
                child: const Text("Test"))
          ],
        ),
      ),
    );
  }
}

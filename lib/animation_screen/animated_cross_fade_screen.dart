import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({Key key}) : super(key: key);

  @override
  State<AnimatedCrossFadeScreen> createState() =>
      _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
                firstChild: Text("Hello, Mahmoud"),
                secondChild: Text("Second Child"),
                crossFadeState: crossFadeState,
                duration: Duration(milliseconds: 500)),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (crossFadeState == CrossFadeState.showFirst) {
                      crossFadeState = CrossFadeState.showSecond;
                    } else {
                      crossFadeState = CrossFadeState.showFirst;
                    }
                  setState(() {
                    
                  });
                },
                child: Text("Test"))
          ],
        ),
      ),
    );
  }
}

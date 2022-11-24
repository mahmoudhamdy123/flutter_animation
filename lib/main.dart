import 'package:flutter/material.dart';
import 'package:flutter_animation/animation_screen/animated_cross_fade_screen.dart';
import 'package:flutter_animation/animation_screen/animated_dynamic_list_screen.dart';
import 'package:flutter_animation/animation_screen/fade_animation_screen.dart';
import 'animation_screen/animated_builder_screen.dart';
import 'animation_screen/animated_container.dart';
import 'animation_screen/animations_from_scratch.dart';
import 'animation_screen/flutter_hero_animation.dart';
import 'animation_screen/pageRouteBuilder_screen.dart';
import 'animation_screen/slide_transition.dart';
import 'animation_screen/transition_opacity_screen.dart';
import 'shared/resources/navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Flutter Animation"),
              centerTitle: true,
              background: FlutterLogo(
                size: 20,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Card(
                child: ListTile(
                  title: const Text("Set up a PageRouteBuilder"),
                  onTap: () {
                    Navigator.of(context)
                        .push(createRoute(PageRouteBuilderScreen()));
                  },
                ),
              ),
              Card(
                child: GestureDetector(
                  child: const Hero(
                    tag: 'imageHero',
                    child: FadeInImage(
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/images/image2.png'),
                      image: NetworkImage(
                          "https://docs.flutter.dev/assets/images/flutter-logo-sharing.png"),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 1000),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return HeroAnimationScreen();
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return Align(
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Container Animation Controiler"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AnimationsFromScratchScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Using the AnimatedBuilder Widget"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimatedBuilderScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("AnimatedContainer"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimatedContainerScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Animation & Transition Opacity"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransitionOpacityScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Slide Transition"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SlideTransitionScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Fade Animation"),
                  onTap: () {
                    Navigator.of(context)
                        .push(createRoute(FadeAnimationScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Animated Cross Fade"),
                  onTap: () {
                    Navigator.of(context)
                        .push(createRoute(const AnimatedCrossFadeScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Animated Dynamic List"),
                  onTap: () {
                    Navigator.of(context)
                        .push(createRoute(const AnimatedDynamicListScreen()));
                  },
                ),
              ),
              const SizedBox(
                height: 200,
              )
            ]),
          )
        ],
      ),
    );
  }
}

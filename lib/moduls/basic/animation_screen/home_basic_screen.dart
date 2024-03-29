import 'package:flutter/material.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/abimated_clip_path_screen.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/animated_builder_screen.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/animated_container.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/animated_cross_fade_screen.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/animated_dynamic_list_screen.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/animations_from_scratch.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/fade_animation_screen.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/flutter_hero_animation.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/pageRouteBuilder_screen.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/slide_transition.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/animated_positioned_screen.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/transition_opacity_screen.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/transition_animation.dart';
import 'package:flutter_animation/shared/resources/navigation.dart';

class HomeBasicScreen extends StatelessWidget {
  const HomeBasicScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            title: const Text("Set up a PageRouteBuilder"),
            onTap: () {
              Navigator.of(context).push(createRoute(const PageRouteBuilderScreen()));
            },
          ),
        ),
        Card(
          child: GestureDetector(
            child: Hero(
              tag: 'imageHero',
              child: Image.asset('assets/images/image2.png'),
            ),
            onTap: () {
              Navigator.of(context).push(
                createRoute(const HeroAnimationScreen()),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Animations From Scratch"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AnimationsFromScratchScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Animated Builder"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AnimatedBuilderScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Animated Container"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AnimatedContainerScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Transition Opacity"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TransitionOpacityScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Slide Transition"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SlideTransitionScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Fade Animation"),
            onTap: () {
              Navigator.of(context).push(createRoute(FadeAnimationScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Animated Cross Fade"),
            onTap: () {
              Navigator.of(context).push(createRoute(const AnimatedCrossFadeScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Animated Dynamic List"),
            onTap: () {
              Navigator.of(context).push(createRoute(const AnimatedDynamicListScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Animated Clip Path"),
            onTap: () {
              Navigator.of(context).push(createRoute(const AnimatedClipPathScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Transition Animation"),
            onTap: () {
              Navigator.of(context).push(createRoute(const TransitionAnimationScreen()));
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Animated Positioned"),
            onTap: () {
              Navigator.of(context).push(createRoute(const AnimatedPositionedScreen()));
            },
          ),
        ),
        const SizedBox(
          height: 200,
        )
      ],
    );
  }
}

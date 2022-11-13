import 'package:flutter/material.dart';
import 'package:flutter_animation/animation_screen/animated_cross_fade_screen.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Flutter Animation"),
              centerTitle: true,
              background: FlutterLogo(size:20,),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Card(
                child: ListTile(
                  title: Text("Set up a PageRouteBuilder"),
                  onTap: () {
                    Navigator.of(context).push(createRoute( PageRouteBuilderScreen()));
                  },
                ),
              ),
              Card(
                child: GestureDetector(
                  child: Hero(
                    tag: 'imageHero',
                    child: FadeInImage(
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/images/image2.png'),
                      image: NetworkImage("https://docs.flutter.dev/assets/images/flutter-logo-sharing.png"),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 1000),
                        pageBuilder: (
                            BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return HeroAnimationScreen();
                        },
                        transitionsBuilder: (
                            BuildContext context,
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
                  title: Text("Container Animation Controiler"),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>AnimationsFromScratchScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Using the AnimatedBuilder Widget"),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>AnimatedBuilderScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("AnimatedContainer"),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>AnimatedContainerScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Animation & Transition Opacity"),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>TransitionOpacityScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Slide Transition"),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>SlideTransitionScreen()));
                  },
                ),
              ),
               Card(
                child: ListTile(
                  title: Text("Fade Animation"),
                  onTap: () {
                    Navigator.of(context).push(createRoute(FadeAnimationScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Animated Cross Fade"),
                  onTap: () {
                    Navigator.of(context).push(createRoute(AnimatedCrossFadeScreen()));
                  },
                ),
              ),
              SizedBox(height: 200,)
            ]),
          )
        ],
      ),
    );
  }
}



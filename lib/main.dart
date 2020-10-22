import 'package:flutter/material.dart';
import 'animation_screen/animated_builder_screen.dart';
import 'animation_screen/animated_container.dart';
import 'animation_screen/animations_from_scratch.dart';
import 'animation_screen/flutter_hero_animation.dart';
import 'animation_screen/pageRouteBuilder_screen.dart';
import 'animation_screen/slide_transition.dart';
import 'animation_screen/transition_opacity_screen.dart';


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
                    Navigator.of(context).push(_createRoute());
                  },
                ),
              ),
              Card(
                child: GestureDetector(
                  child: Hero(
                    tag: 'imageHero',
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/image2.png'),
                      image: NetworkImage("https://assets.website-files.com/5e3c45dea042cf97f3689681/5e417cd336a72b06a86c73e7_Flutter-Tutorial-Header%402x.jpg"),
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
              SizedBox(height: 200,)
            ]),
          )
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        PageRouteBuilderScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.linear;
      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

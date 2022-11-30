import 'package:flutter/material.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/home_basic_screen.dart';
import 'package:flutter_animation/shared/resources/app_images.dart';
import 'package:flutter_animation/shared/resources/app_style.dart';
import 'dart:math';

import 'package:flutter_animation/shared/resources/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue[400]!, Colors.blue[800]!],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        SafeArea(
            child: Container(
          width: 250,
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AppImages.ironMan),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mahmoud Hamdy",
                  style: AppTextStyle.styleWhite20,
                ),
              ],
            )),
            Expanded(
                child: ListView(
              children: <Widget>[
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(createRoute(const HomeBasicScreen()));
                  },
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Home",
                    style: AppTextStyle.styleWhite,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Profile",
                    style: AppTextStyle.styleWhite,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Settings",
                    style: AppTextStyle.styleWhite,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Log out",
                    style: AppTextStyle.styleWhite,
                  ),
                )
              ],
            ))
          ]),
        )),
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            builder: ((context, val, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text("Flutter Animations"),
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        setState(() {
                          value == 0 ? value = 1 : value = 0;
                        });
                      },
                    ),
                  ),
                ),
              );
            })),
        GestureDetector(
          onHorizontalDragUpdate: (e) {
            if (e.delta.dx > 0) {
              setState(() {
                value = 1;
              });
            } else {
              setState(() {
                value = 0;
              });
            }
          },
        )
      ]),
    );
  }
}

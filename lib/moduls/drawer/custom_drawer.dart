import 'package:flutter/material.dart';
import 'package:flutter_animation/core/models/drawer_item_model.dart';
import 'package:flutter_animation/moduls/basic/animation_screen/home_basic_screen.dart';
import 'package:flutter_animation/shared/resources/app_images.dart';
import 'package:flutter_animation/shared/resources/app_style.dart';
import 'dart:math';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key, required this.child, required this.onTap}) : super(key: key);

  final Widget? child;
  final Function(Widget child) onTap;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  double value = 0;
  List<DrawerItemModel> items = [
    DrawerItemModel(child: const SizedBox(), icon: Icons.home, title: "Home"),
    DrawerItemModel(child: const HomeBasicScreen(), icon: Icons.start_rounded, title: "Basic"),
    DrawerItemModel(child: const SizedBox(), icon: Icons.settings, title: "Settings"),
    DrawerItemModel(child: const SizedBox(), icon: Icons.logout, title: "Log out"),
  ];

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
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        widget.onTap(items[index].child);
                        setState(() {
                          value = 0;
                        });
                      },
                      leading: Icon(
                        items[index].icon,
                        color: Colors.white,
                      ),
                      title: Text(
                        items[index].title,
                        style: AppTextStyle.styleWhite,
                      ),
                    );
                  }),
            ),
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
                  body: widget.child,
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

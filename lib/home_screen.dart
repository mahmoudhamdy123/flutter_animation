import 'package:flutter/material.dart';
import 'package:flutter_animation/moduls/drawer/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget child = const SizedBox();

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: child,
      onTap: (Widget value) {
        setState(() {
          child = value;
        });
      },
    );
  }
}

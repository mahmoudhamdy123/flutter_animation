import 'package:flutter/material.dart';

Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
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

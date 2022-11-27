import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      this.title = '',
      this.titleSize,
      this.centerTitle = true,
      this.actions,
      this.onPressedLeading,
      this.disableLeading = false})
      : super(key: key);

  final String? title;
  final double? titleSize;
  final bool? centerTitle;
  final List<Widget>? actions;
  final VoidCallback? onPressedLeading;
  final bool? disableLeading;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title!,
        style: const TextStyle(color: Colors.black),
      ),
      leading: disableLeading!
          ? null
          : IconButton(
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: onPressedLeading ?? () => Navigator.of(context).pop()),
      centerTitle: centerTitle,
      actions: actions,
    );
  }
}

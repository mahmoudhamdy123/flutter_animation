import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/item_widget.dart';

class CustomAnimatedLisWidget extends StatefulWidget {
  const CustomAnimatedLisWidget({Key? key}) : super(key: key);

  @override
  State<CustomAnimatedLisWidget> createState() =>
      _CustomAnimatedLisWidgetState();
}

class _CustomAnimatedLisWidgetState extends State<CustomAnimatedLisWidget> {
  final GlobalKey<AnimatedListState> key = GlobalKey();
  final ScrollController scrollController = ScrollController();
  List<String> items = <String>[
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
    "Animated List",
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: key,
      controller: scrollController,
      initialItemCount: items.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
            position: animation.drive(
                Tween(begin: const Offset(1, 0), end: const Offset(0, 0))),
            child: ItemWidget(
              title: items[index],
              onPressed: () {
                deleteItem(index);
              },
            ));
      },
    );
  }

  void deleteItem(int index) {
    String itemString = items.removeAt(index);
    key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: ItemWidget(
              title: itemString,
              onPressed: () {},
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/item_widget.dart';

class CustomAnimatedDynamicLisWidget extends StatefulWidget {
  const CustomAnimatedDynamicLisWidget({Key? key}) : super(key: key);

  @override
  State<CustomAnimatedDynamicLisWidget> createState() =>
      _CustomAnimatedDynamicLisWidgetState();
}

class _CustomAnimatedDynamicLisWidgetState
    extends State<CustomAnimatedDynamicLisWidget> {
  final GlobalKey<AnimatedListState> key = GlobalKey();
  final ScrollController scrollController = ScrollController();
  List<String> items = <String>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: key,
            controller: scrollController,
            initialItemCount: items.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                  position: animation.drive(Tween(
                      begin: const Offset(1, 0), end: const Offset(0, 0))),
                  child: ItemWidget(
                    title: items[index],
                    onPressed: () {
                      deleteItem(index);
                    },
                  ));
            },
          ),
        ),
        ElevatedButton(
            onPressed: () {
              insertItem();
            },
            child: const Text("Add New Item"))
      ],
    );
  }

  void insertItem() {
    int index = items.length;
    items.add("Animated List ${index + 1}");
    key.currentState!.insertItem(index);
    Future.delayed(const Duration(microseconds: 300), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
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

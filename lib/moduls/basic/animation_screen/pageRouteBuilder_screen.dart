import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/appBar/custom_app_bar.dart';

class PageRouteBuilderScreen extends StatelessWidget {
  const PageRouteBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Page Route Builder",
      ),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}

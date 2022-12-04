import 'package:flutter/material.dart';
import 'package:flutter_animation/moduls/basic/models/color_model.dart';
import 'package:flutter_animation/shared/components/appBar/custom_app_bar.dart';
import 'package:flutter_animation/shared/components/list/grid_view_item.dart';

class AnimatedClipPathScreen extends StatefulWidget {
  const AnimatedClipPathScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedClipPathScreen> createState() => _AnimatedClipPathScreenState();
}

class _AnimatedClipPathScreenState extends State<AnimatedClipPathScreen>
    with SingleTickerProviderStateMixin {
  List<ColorModel> colors = const <ColorModel>[
    ColorModel(Color(0xffA232B8), Alignment.topLeft),
    ColorModel(Color(0xffDBDBDB), Alignment.topCenter),
    ColorModel(Color(0xffA8E0FF), Alignment.topRight),
    ColorModel(Color(0xffB08EA2), Alignment.centerRight),
    ColorModel(Color(0xffFA9DE7), Alignment.centerLeft),
    ColorModel(Color(0xffF0C0B6), Alignment.bottomLeft),
    ColorModel(Color(0xffC8B8E3), Alignment.bottomCenter),
    ColorModel(Color(0xffB6F0EB), Alignment.bottomRight),
  ];
  late AnimationController animationController;
  late ColorModel currentColor;
  late ColorModel prevColor;
  @override
  void initState() {
    super.initState();
    currentColor = colors.first;
    prevColor = colors.last;
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Animated Clip Path',
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .55,
                width: double.infinity,
                color: prevColor.color,
              ),
              AnimatedBuilder(
                  animation: animationController,
                  builder: (context, _) {
                    return ClipPath(
                      clipper: CusromPath(animationController.value, currentColor.alignment),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .55,
                        width: double.infinity,
                        color: currentColor.color,
                      ),
                    );
                  }),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: colors.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, crossAxisSpacing: 12, mainAxisSpacing: 12),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        currentColor = colors[index];
                        animationController.forward(from: 0.0).whenComplete(() {
                          prevColor = currentColor;
                          setState(() {});
                        });
                      },
                      child: GridViewItem(
                        color: colors[index].color,
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class CusromPath extends CustomClipper<Path> {
  final double value;
  final Alignment alignment;

  const CusromPath(this.value, this.alignment);
  @override
  Path getClip(Size size) {
    Path path = Path();
    if (alignment == Alignment.topLeft) {
      buildPath(
        path,
        size,
        const Offset(0, 0),
      );
    } else if (alignment == Alignment.topCenter) {
      buildPath(
        path,
        size,
        Offset(size.width / 2, 0),
      );
    } else if (alignment == Alignment.topRight) {
      buildPath(
        path,
        size,
        Offset(size.width, 0),
      );
    } else if (alignment == Alignment.centerRight) {
      buildPath(
        path,
        size,
        Offset(size.width, size.height / 2),
      );
    } else if (alignment == Alignment.bottomRight) {
      buildPath(
        path,
        size,
        Offset(size.width, size.height),
      );
    } else if (alignment == Alignment.bottomCenter) {
      buildPath(
        path,
        size,
        Offset(size.width / 2, size.height),
      );
    } else if (alignment == Alignment.bottomLeft) {
      buildPath(
        path,
        size,
        Offset(0, size.height),
      );
    } else if (alignment == Alignment.centerLeft) {
      buildPath(
        path,
        size,
        Offset(0, size.height / 2),
      );
    }

    return path;
  }

  void buildPath(Path path, Size size, Offset offset) {
    path.addOval(Rect.fromCenter(
        center: offset, width: size.width * 2 * value, height: size.height * 2 * value));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

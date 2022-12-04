import 'package:flutter/material.dart';
import 'package:flutter_animation/shared/components/stars_widget.dart';
import 'package:flutter_animation/shared/resources/app_images.dart';

class ContentInformationWidget extends StatelessWidget {
  const ContentInformationWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const Text("Mahmoud Hamdy"),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                "Rating product",
                style: TextStyle(color: Colors.black45),
              ),
              StarsWidget(stars: 4),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [AppImages.avengers, AppImages.ironMan, AppImages.ironMan2, AppImages.thor]
                .map((String image) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black12,
                        backgroundImage: AssetImage(image),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

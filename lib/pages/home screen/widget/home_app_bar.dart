import 'package:e_comapp/constant/constant.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: kcontentColor),
          onPressed: () {},
          icon: Image.asset(
            "assets/icon.png",
            height: 20,
          ),
        ),
        IconButton(
          iconSize: 30,
          style: IconButton.styleFrom(
              padding: const EdgeInsets.all(15),
              backgroundColor: kcontentColor),
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
          ),
        ),
      ],
    );
  }
}


import 'package:e_comapp/constant/constant.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kcontentColor, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.grey,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search..",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Container(
              height: 25,
              width: 1.5,
              color: Colors.grey,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
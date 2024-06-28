import 'package:e_comapp/constant/constant.dart';
import 'package:e_comapp/pages/cart/ui/cart_screen.dart';
import 'package:e_comapp/pages/favourite/ui/favourite_screen.dart';
import 'package:e_comapp/pages/home%20screen/ui/home_screen.dart';
import 'package:e_comapp/pages/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;

  List sreens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sreens[currentIndex],
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: kprimaryColor,
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
          child: const Icon(
            Icons.home_outlined,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        elevation: 10,
        height: 60,
        color: Colors.white70,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(
                  () {
                    currentIndex = 0;
                  },
                );
              },
              icon: Icon(
                Icons.grid_view_outlined,
                size: 30,
                color: currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
                color: currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

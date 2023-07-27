import 'package:audiohub/views/cart/cart_screen.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/home/widget/drawer_tile.dart';
import 'package:audiohub/views/orders/orders.dart';
import 'package:audiohub/views/profile/profile.dart';
import 'package:audiohub/views/settings/settings.dart';
import 'package:audiohub/views/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.4,
      child: SizedBox(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 38, backgroundImage: AssetImage('assets/images/unknown.jpg')),
                  SizedBox(
                    height: 15,
                  ),
                  Text('User name'),
                ],
              ),
            ),
            SizedBox(
              height: kheight * 0.02,
            ),
            DrawerTile(
                ontap: () {
                  log('pressed wishlist');
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const WishlistScreen()));
                },
                icon: const Icon(Icons.favorite_border),
                title: 'Wishlist'),
            DrawerTile(
                ontap: () {
                  log('pressed cart');
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Cart()));
                },
                icon: const Icon(Icons.shopping_cart),
                title: 'Cart'),
            DrawerTile(
                ontap: () {
                  log('pressed orders');
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const MyOrders()));
                },
                icon: const Icon(Icons.inventory),
                title: 'Orders'),
            DrawerTile(
                ontap: () {
                  Navigator.of(context).pop();
                  log('pressed profile');
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const MyProfile()));
                },
                icon: const Icon(Icons.person),
                title: 'Profile'),
            DrawerTile(
                ontap: () {
                  Navigator.of(context).pop();
                  log('pressed Settings');
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const Settings()));
                },
                icon: const Icon(Icons.settings),
                title: 'Settings'),
          ],
        ),
      ),
    );
  }
}

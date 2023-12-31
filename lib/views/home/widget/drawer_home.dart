import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/views/cart/cart_screen.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/home/widget/drawer_tile.dart';
import 'package:audiohub/views/orders/orders.dart';
import 'package:audiohub/views/profile/profile.dart';
import 'package:audiohub/views/settings/settings.dart';
import 'package:audiohub/views/wishlist/wishlist.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      surfaceTintColor: const Color.fromARGB(255, 5, 121, 215),
      child: SizedBox(
        child: ListView(
          children: [
            FutureBuilder(
              future: FetchDataFirebase.fetchUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 38,
                          backgroundImage: snapshot.data!.image.isEmpty
                              ? AssetImage('assets/images/unknown.jpg')
                              : NetworkImage(snapshot.data!.image) as ImageProvider,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(snapshot.data!.name),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: kheight * 0.02,
            ),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const WishlistScreen()));
              },
              icon: const Icon(Icons.favorite_border),
              title: 'Wishlist',
            ),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(Icons.shopping_cart),
              title: 'Cart',
            ),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyOrders()));
              },
              icon: const Icon(Icons.inventory),
              title: 'Orders',
            ),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const MyProfile()));
              },
              icon: const Icon(Icons.person),
              title: 'Profile',
            ),
            DrawerTile(
              ontap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const Settings()));
              },
              icon: const Icon(Icons.settings),
              title: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

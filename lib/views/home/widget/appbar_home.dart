import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/search/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(Icons.menu, size: 30.0),
      ),
      leadingWidth: kwidth * 0.15,
      title: Text(
        'AUDIOHUB',
        style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: kwidth * 0.05),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchScrn(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 25,
              color: Colors.black,
            ),
          ),
        )
      ],
      shadowColor: Colors.black,
      elevation: 5,
      backgroundColor: Colors.white,
      bottom: const TabBar(
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          // padding: EdgeInsets.symmetric(horizontal: 10),
          // labelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),

          indicatorColor: Colors.black,
          labelColor: Colors.black,
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Neckband',
            ),
            Tab(
              text: 'Headphones',
            ),
            Tab(
              text: 'TWS',
            ),
          ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.6);
}

import 'package:audiohub/views/home/headphone.dart';
import 'package:audiohub/views/home/neckband.dart';
import 'package:audiohub/views/home/all_screen.dart';
import 'package:audiohub/views/home/tws.dart';
import 'package:audiohub/views/home/widget/appbar_home.dart';
import 'package:audiohub/views/home/widget/drawer_home.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: HomeAppbar(),
        drawer: HomeDrawer(),
        body: TabBarView(children: [
          AllScreens(),
          NeckbandScreen(),
          HeadphoneScreen(),
          TWSScreen(),
        ]),
      ),
    );
  }
}

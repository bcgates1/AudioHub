import 'package:audiohub/controllers/cart/cart.dart';
import 'package:audiohub/controllers/checkout/address_selector.dart';
import 'package:audiohub/controllers/checkout/payment_selector/payment_selector.dart';
import 'package:audiohub/controllers/search/search_ctrl.dart';
import 'package:audiohub/controllers/wishlist/wishlist_controller.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    kheight = MediaQuery.sizeOf(context).height;
    kwidth = MediaQuery.sizeOf(context).width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PaymentSelector(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddressSelector(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

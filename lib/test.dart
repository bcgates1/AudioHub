// import 'package:audiohub/service/cart_fuctions/cart_fuctions.dart';
// import 'package:audiohub/service/firebase/fetchdata.dart';
// import 'package:audiohub/views/cart/widgets/cart_tile.dart';
// import 'package:audiohub/views/core/style.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CartItems extends StatelessWidget {
//   const CartItems({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: FetchDataFirebase.cart.snapshots(),
//         builder: (context, snapshot1) {
//           if (!snapshot1.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return FutureBuilder(
//               future: total(snapshot: snapshot1.data!.docs),
//               builder: (context, snapshot2) {
//                 if (!snapshot2.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 return Column(
//                   children: [
//                     SizedBox(
//                       height: kheight * 0.52,
//                       child: SingleChildScrollView(
//                         child: ListView.separated(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: kwidth * 0.03, vertical: kheight * 0.01),
//                           itemCount: snapshot1.data!.docs.length,
//                           shrinkWrap: true,
//                           separatorBuilder: (context, index) => const Divider(),
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) => FutureBuilder(
//                             future: FetchDataFirebase.fetchProductWithId(
//                                 productId: snapshot1.data!.docs[index].id),
//                             builder: (BuildContext context, snapshot3) {
//                               if (snapshot3.connectionState == ConnectionState.done) {
//                                 return CartTile(
//                                   imgpath: snapshot3.data!['image'][0],
//                                   name: snapshot3.data!['name'],
//                                   price: snapshot3.data!['price'] *
//                                       snapshot1.data!.docs[index]['quantity'],
//                                   quantity: snapshot1.data!.docs[index]['quantity'],
//                                   productId: snapshot1.data!.docs[index].id,
//                                 );
//                               } else {
//                                 return const Center(
//                                   child: CircularProgressIndicator(),
//                                 );
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'PRICE DETAILS',
//                             style: GoogleFonts.inter(color: Colors.black),
//                           ),
//                           const Divider(),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'SUBTOTAL',
//                                     style: GoogleFonts.inter(color: Colors.black),
//                                   ),
//                                   Text('DELIVERY FEE',
//                                       style: GoogleFonts.inter(color: Colors.black))
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     snapshot2.data.toString(),
//                                     style: GoogleFonts.inter(color: Colors.black),
//                                   ),
//                                   Text('₹0.00', style: GoogleFonts.inter(color: Colors.black))
//                                 ],
//                               )
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05),
//                             child: Container(
//                               height: 50,
//                               color: Colors.black,
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Total',
//                                       style: GoogleFonts.inter(
//                                           color: Colors.white, fontWeight: FontWeight.bold),
//                                     ),
//                                     Text(snapshot2.data.toString(),
//                                         style: GoogleFonts.inter(
//                                             color: Colors.white, fontWeight: FontWeight.bold))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 30)
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               });
//         });
//   }
// }

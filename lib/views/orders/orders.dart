import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/orders/order_details.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Orders'),
        body: FutureBuilder(
          future: FetchDataFirebase.fetchAllOrders(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: kwidth * 0.05),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    int length = snapshot.data![index]['orderItems'].length;

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kwidth * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: kwidth * 0.2,
                            height: kwidth * 0.2,
                            child: length == 1
                                ? Image.network(
                                    snapshot.data![index]['orderItems']['0']['image'],
                                    fit: BoxFit.cover,
                                  )
                                : OverflowBox(
                                    maxHeight: 200,
                                    // maxWidth: 100,
                                    child: LottieBuilder.asset(
                                      'assets/lotties/order_group_cart.json',
                                    ),
                                  ),
                          ),
                          SizedBox(
                            width: kwidth * 0.6,
                            height: kwidth * 0.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //to check if order is group order or not
                                Text(
                                  length == 1
                                      ? snapshot.data![index]['orderItems']['0']['name']
                                      : 'Group Order',
                                ),
                                Text(
                                  'Order# ${snapshot.data![index]['orderId']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Date: ${snapshot.data![index]['orderDateTime']}',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: kwidth * 0.1,
                            height: kwidth * 0.2,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OrderDetails(
                                          data: snapshot.data!,
                                          mainIndex: index,
                                        )));
                              },
                              iconSize: 40,
                              icon: const Icon(
                                Icons.navigate_next_outlined,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data!.length,
                  reverse: true,
                ),
              );
            } else {
              return Center(
                child: Text('No Orders'),
              );
            }
          },
        ),
      ),
    );
  }
}

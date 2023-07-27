import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarCom(title: 'Order Details'),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Order Id #000000'),
            Divider(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sony WH-1000XM5',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Brand: Sony'),
                    Text('Price: ₹28990'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

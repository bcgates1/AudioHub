import 'package:audiohub/utils/constants/app_constants.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.data, required this.mainIndex});
  final List data;
  final int mainIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCom(title: 'Order Details'),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order# ${data[mainIndex]['orderId']}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data[mainIndex]['orderItems'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: ListTile(
                          contentPadding: EdgeInsets.all(5),
                          leading: SizedBox(
                            width: kwidth * 0.2,
                            child: Image.network(
                              data[mainIndex]['orderItems']['$index']['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            data[mainIndex]['orderItems']['$index']['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Price: ${numberformat.format(data[mainIndex]['orderItems']['$index']['price'])}'),
                              Text(
                                  'Total: ${numberformat.format(data[mainIndex]['orderItems']['$index']['price'] * data[mainIndex]['orderItems']['$index']['quantity'])}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Quantity',
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(width: kwidth * 0.01),
                              Container(
                                height: kheight * 0.03,
                                width: kwidth * 0.09,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${data[mainIndex]['orderItems']['$index']['quantity']}',
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              ),
              Divider(),
              Text(
                  'Total Amount: ${numberformat.format(int.parse(data[mainIndex]['orderAmount']))}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Payment Method: ${data[mainIndex]['paymentMethod']}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Delivery Address:', style: TextStyle(fontWeight: FontWeight.bold)),
              Column(
                children: [
                  Text('${data[mainIndex]['orderAddress']['name']}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${data[mainIndex]['orderAddress']['houseNo']}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${data[mainIndex]['orderAddress']['city']}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data[mainIndex]['orderAddress']['district']}, ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${data[mainIndex]['orderAddress']['state']}, ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${data[mainIndex]['orderAddress']['pincode']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    '${data[mainIndex]['orderAddress']['mobile']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${data[mainIndex]['orderAddress']['landmark']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: kheight * 0.01,
              ),
              OrderTrackerZen(
                tracker_data: [
                  TrackerData(
                    title: 'Order Placed',
                    date: data[mainIndex]['orderDateTime'].toString(),
                    tracker_details: [
                      // TrackerDetails contains detailed information about a specific event in the order tracking process.
                      TrackerDetails(
                        title: "Your order will be shipping soon",
                        datetime: data[mainIndex]['orderDateTime'].toString(),
                      ),
                    ],
                  ),
                  if (data[mainIndex]['shippingdate'] != '')
                    TrackerData(
                      title: 'Order Shipped',
                      date: data[mainIndex]['shippingdate'].toString(),
                      tracker_details: [
                        // TrackerDetails contains detailed information about a specific event in the order tracking process.
                        TrackerDetails(
                          title: "Your order was shipped",
                          datetime: data[mainIndex]['shippingdate'].toString(),
                        ),
                      ],
                    ),
                  if (data[mainIndex]['deliverydate'] != '')
                    TrackerData(
                      title: 'Order delivered',
                      date: data[mainIndex]['deliverydate'].toString(),
                      tracker_details: [
                        // TrackerDetails contains detailed information about a specific event in the order tracking process.
                        TrackerDetails(
                          title: "Your order was delivered",
                          datetime: data[mainIndex]['deliverydate'].toString(),
                        )
                      ],
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:audiohub/controllers/cart/cart.dart';
import 'package:audiohub/controllers/checkout/address_selector.dart';
import 'package:audiohub/models/buy_now.dart';
import 'package:audiohub/models/cart_model.dart';
import 'package:audiohub/models/order_model.dart';
import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CreateOrder {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Generates a random UUID
  String generateOrderID() {
    const Uuid uuid = Uuid();
    String orderID = uuid.v1();
    orderID = orderID.split('-').join();

    return orderID;
  }

  createorder({
    required CartController cartItems,
    required AddressSelector address,
    bool cod = false,
  }) async {
    Map orderItems = {};

    for (int i = 0; i < cartItems.cartQuantity.length; i++) {
      Map<String, dynamic> itemData = CartQuantitySetter(cartItems: cartItems, index: i);
      orderItems['$i'] = itemData;
    }

    final OrderModel orderModel = OrderModel(
      orderId: generateOrderID(),
      orderStatus: 'Order Placed',
      orderDateTime: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()).toString(),
      orderAmount: cartItems.totalPrice.toString(),
      paymentMethod: cod ? 'COD' : 'Razorpay',
      orderItems: orderItems,
      orderAddress: address.addressList[address.selectedIndex],
      mobile: address.addressList[address.selectedIndex]['mobile'],
    );

    try {
      DocumentReference userOrderDocRef =
          _firestore.collection('orders').doc(FetchDataFirebase().uid);

      DocumentSnapshot userOrderSnapshot = await userOrderDocRef.get();

      if (userOrderSnapshot.exists) {
        // If the document exists, update the existing array
        await userOrderDocRef.update({
          'orderLists': FieldValue.arrayUnion([orderModel.tomap(orderModel: orderModel)])
        });
      } else {
        // If the document doesn't exist
        await userOrderDocRef.set({
          'orderLists': [orderModel.tomap(orderModel: orderModel)]
        });
      }
    } on FirebaseException catch (e) {
      toastMessage(message: e.message.toString());
    }
  }

  Map<String, dynamic> CartQuantitySetter({required CartController cartItems, required int index}) {
    CartModel cartModel = CartModel(
      name: cartItems.allProduct['$index']['name'],
      price: cartItems.allProduct['$index']['price'],
      quantity: cartItems.cartQuantity[index]['quantity'],
      image: cartItems.allProduct['$index']['image'][0],
    );
    return cartModel.toMap(cartModel: cartModel);
  }

  createorderBuyNow({
    required AddressSelector address,
    bool cod = false,
  }) async {
    Map orderItems = {};

    orderItems['0'] = BuyNow.toMap();

    final OrderModel orderModel = OrderModel(
      orderId: generateOrderID(),
      orderStatus: 'Order Placed',
      orderDateTime: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()).toString(),
      orderAmount: (BuyNow.price! * BuyNow.quantity!).toString(),
      paymentMethod: cod ? 'COD' : 'Razorpay',
      orderItems: orderItems,
      orderAddress: address.addressList[address.selectedIndex],
      mobile: address.addressList[address.selectedIndex]['mobile'],
    );

    try {
      DocumentReference userOrderDocRef =
          _firestore.collection('orders').doc(FetchDataFirebase().uid);

      DocumentSnapshot userOrderSnapshot = await userOrderDocRef.get();

      if (userOrderSnapshot.exists) {
        // If the document exists, update the existing array
        await userOrderDocRef.update({
          'orderLists': FieldValue.arrayUnion([orderModel.tomap(orderModel: orderModel)])
        });
      } else {
        // If the document doesn't exist
        await userOrderDocRef.set({
          'orderLists': [orderModel.tomap(orderModel: orderModel)]
        });
      }
    } on FirebaseException catch (e) {
      toastMessage(message: e.message.toString());
    }
  }
}

class OrderModel {
  String orderId;
  String orderStatus;
  String orderDateTime;
  String? shippingdate;
  String? deliverydate;
  String orderAmount;
  String paymentMethod;
  Map orderItems;
  Map orderAddress;
  String? mobile;

  OrderModel({
    required this.orderId,
    required this.orderStatus,
    required this.orderDateTime,
    this.shippingdate = '',
    this.deliverydate = '',
    required this.orderAmount,
    required this.paymentMethod,
    required this.orderItems,
    required this.orderAddress,
    required this.mobile,
  });

  Map<String, dynamic> tomap({required OrderModel orderModel}) {
    return {
      'orderId': orderModel.orderId,
      'orderStatus': orderModel.orderStatus,
      'orderDateTime': orderModel.orderDateTime,
      'shippingdate': orderModel.shippingdate,
      'deliverydate': orderModel.deliverydate,
      'orderAmount': orderModel.orderAmount,
      'paymentMethod': orderModel.paymentMethod,
      'orderItems': orderModel.orderItems,
      'orderAddress': orderModel.orderAddress,
      'mobile': orderModel.mobile
    };
  }

  factory OrderModel.Frommap({required Map<String, dynamic> data}) {
    return OrderModel(
      orderId: data['orderId'],
      orderStatus: data['orderStatus'],
      orderDateTime: data['orderDateTime'],
      shippingdate: data['shippingdate'],
      deliverydate: data['deliverydate'],
      orderAmount: data['orderAmount'],
      paymentMethod: data['paymentMethod'],
      orderItems: data['orderItems'],
      orderAddress: data['orderAddress'],
      mobile: data['mobile'],
    );
  }
}

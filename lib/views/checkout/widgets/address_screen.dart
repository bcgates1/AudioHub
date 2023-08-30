import 'package:audiohub/views/checkout/widgets/address_adding.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCom(title: 'Add Address'),
      body: AddressAdding(),
    );
  }
}

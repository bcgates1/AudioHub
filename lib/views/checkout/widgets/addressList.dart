import 'package:audiohub/controllers/checkout/address_selector.dart';
import 'package:audiohub/views/checkout/widgets/address_screen.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/common_widgets/delete_alert.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCom(title: 'Select Address'),
      body: Consumer<AddressSelector>(
        builder: (context, value, child) => value.addressList.isNotEmpty
            ? ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: kwidth * 0.01, vertical: kheight * 0.01),
                itemBuilder: (context, index) {
                  return ListTile(
                      minVerticalPadding: 0,
                      leading: Container(
                        width: kwidth * 0.05,
                        decoration: BoxDecoration(border: Border.all(), shape: BoxShape.circle),
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: value.selectedIndex == index
                                  ? Colors.black
                                  : const Color.fromARGB(255, 205, 205, 205)),
                        ),
                      ),
                      title: Text(
                        value.addressList[index]['name'],
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(value.addressList[index]['houseNo']),
                          Text(value.addressList[index]['city']),
                          Row(
                            children: [
                              Text('${value.addressList[index]['district']}, '),
                              Text('${value.addressList[index]['state']}, '),
                              Text(value.addressList[index]['pincode']),
                            ],
                          ),
                          Text(value.addressList[index]['mobile'].toString()),
                          Text(value.addressList[index]['landmark']),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // GestureDetector(
                          //   child: const Icon(
                          //     Icons.edit,
                          //   ),
                          //   // onTap: () => ,
                          // ),
                          // SizedBox(
                          //   width: kwidth * 0.05,
                          // ),
                          GestureDetector(
                            onTap: () => deleteAlert(
                              context: context,
                              onTapfunction: () {
                                value.deleteAddress(context: context, index: index);
                              },
                            ),
                            child: const Icon(Icons.delete_forever),
                          )
                        ],
                      ),
                      onTap: () {
                        value.changeIndex(index);
                        Navigator.of(context).pop();
                      });
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: value.addressList.length)
            : const Center(
                child: Text(
                  'Add Address',
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AddressScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:audiohub/controllers/checkout/address_selector.dart';
import 'package:audiohub/models/address_model.dart';
import 'package:audiohub/service/validator/address.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressAdding extends StatelessWidget {
  AddressAdding({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController houseNoController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AddressSelector addressSelectorValue =
        Provider.of<AddressSelector>(context, listen: false);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(
                Icons.add_location_alt_outlined,
                color: Colors.white,
              ),
              Text(
                'ADD ADDRESS',
                style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          textfield(hint: 'Name', controller: nameController),
          SizedBox(height: kheight * 0.03),
          textfield(hint: 'Flat, House no., Building, Company', controller: houseNoController),
          SizedBox(height: kheight * 0.03),
          textfield(hint: 'City', controller: cityController),
          SizedBox(height: kheight * 0.03),
          textfield(hint: 'District', controller: districtController),
          SizedBox(height: kheight * 0.03),
          textfield(hint: 'State', controller: stateController),
          SizedBox(height: kheight * 0.03),
          textfield(
              hint: 'Pincode', controller: pincodeController, isnumber: true, isPincode: true),
          SizedBox(height: kheight * 0.03),
          textfield(
              hint: 'Mobile number', controller: mobileController, isnumber: true, isMobile: true),
          SizedBox(height: kheight * 0.03),
          textfield(hint: 'Landmark', controller: landmarkController),
          SizedBox(height: kheight * 0.01),
          addAddressButton(context: context, addressSelectorValue: addressSelectorValue),
        ],
      ),
    );
  }

  Widget textfield(
      {required String hint,
      required controller,
      bool isnumber = false,
      bool isMobile = false,
      bool isPincode = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: isnumber ? TextInputType.number : TextInputType.text,
      maxLength: isMobile
          ? 10
          : isPincode
              ? 6
              : null,
      decoration: InputDecoration(
        // fillColor: Colors.white,
        // filled: true,
        counterText: '', //hide the counter of mobile and pincode max length
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: Colors.grey),
        // prefixIcon: const Icon(Icons.not_listed_location_rounded),
        // prefixIconColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget addAddressButton(
      {required BuildContext context, required AddressSelector addressSelectorValue}) {
    return ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          final AddressModel addressModel = AddressModel();
          addressModel.name = nameController.text.trim();
          addressModel.houseNo = houseNoController.text.trim();
          addressModel.city = cityController.text.trim();
          addressModel.district = districtController.text.trim();
          addressModel.state = stateController.text.trim();
          addressModel.pincode = pincodeController.text.trim();
          addressModel.mobile = mobileController.text.trim();
          addressModel.landmark = landmarkController.text.trim();
          if (addressValidation(addressModel: addressModel, context: context)) {
            await addressSelectorValue.addAddress(addressModel: addressModel, context: context);

            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        },
        style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.6, kheight * 0.05)),
            backgroundColor: const MaterialStatePropertyAll(Colors.black),
            shape: const MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))))),
        child: Text(
          'ADD ADDRESS',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}

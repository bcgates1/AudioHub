import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressAdding extends StatelessWidget {
  const AddressAdding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(kheight * 0.02),
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
            SizedBox(height: kheight * 0.03),
            textfield(hint: 'Local Address'),
            SizedBox(height: kheight * 0.03),
            textfield(hint: 'City'),
            SizedBox(height: kheight * 0.03),
            textfield(hint: 'District'),
            SizedBox(height: kheight * 0.03),
            textfield(hint: 'State'),
            SizedBox(height: kheight * 0.03),
            textfield(hint: 'Pincode'),
            SizedBox(height: kheight * 0.03),
            textfield(hint: 'Landmark'),
            SizedBox(height: kheight * 0.03),
            addAddressButton(context)
          ],
        ),
      ),
    );
  }

  Widget textfield({required String hint}) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
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

  Widget addAddressButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            //add address
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.5, kheight * 0.01)),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              foregroundColor: const MaterialStatePropertyAll(Colors.black),
              shape: const MaterialStatePropertyAll(ContinuousRectangleBorder())),
          child: Text(
            'ADD ADDRESS',
            style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
          )),
    );
  }
}

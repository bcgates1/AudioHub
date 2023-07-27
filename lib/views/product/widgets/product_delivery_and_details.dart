import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDeliveryAndDetails extends StatelessWidget {
  const ProductDeliveryAndDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'FREE DELIVERY',
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(
              height: 20,
              child: VerticalDivider(
                color: Colors.grey,
              ),
            ),
            Text(
              'Delivery in 5 days',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        _titletext('Product Details'),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailtext('Brand  ', true),
                _detailtext('Model Name', true),
              ],
            ),
            SizedBox(
              width: kwidth * 0.15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailtext('Sony', false),
                _detailtext('WH1000XM5/BMIN', false),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _titletext(String text) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: kheight * 0.01),
      Text(
        text,
        style: GoogleFonts.inter(color: Colors.black),
      )
    ]);
  }

  Widget _detailtext(String text, bool isbold) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: kheight * 0.01),
      Text(
        text,
        style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black,
            fontWeight: isbold ? FontWeight.bold : FontWeight.normal),
      )
    ]);
  }
}
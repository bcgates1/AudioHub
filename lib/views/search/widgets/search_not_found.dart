import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search for awesome products',
        style: GoogleFonts.inter(color: Colors.black, fontSize: 17),
      ),
    );
  }
}

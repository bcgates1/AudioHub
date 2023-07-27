import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({super.key, required this.ontap, required this.icon, required this.title});
  final Function()? ontap;
  final Icon icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: icon,
      title: Text(
        title,
        style: GoogleFonts.inter(color: Colors.black),
      ),
    );
  }
}

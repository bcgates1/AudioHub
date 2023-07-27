import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/profile/widgets/user_databox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarCom(
          title: 'Profile',
          action: [
            IconButton(
                onPressed: () {
                  //profile edit
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
                height: kheight * 0.28,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: kheight * 0.09,
                    backgroundImage: const AssetImage('assets/images/unknown.jpg'),
                  ),
                )),
            Text(
              'User Name',
              style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            const UserDataBox(title: 'Name', data: 'Username'),
            const UserDataBox(title: 'Email', data: 'Useremail@gmail.com'),
            const UserDataBox(title: 'Phone', data: 'XXXXXXXXXX')
          ],
        ),
      ),
    );
  }
}

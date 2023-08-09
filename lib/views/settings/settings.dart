import 'package:audiohub/service/firebase/authentication.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/settings/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCom(title: 'Settings'),
      body: SizedBox(
        width: double.infinity,
        height: kheight * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {},
              child: const SettingsTiles(
                icon: Icon(
                  Icons.info,
                ),
                text: 'About',
              ),
            ),
            InkWell(
              onTap: () {},
              child: const SettingsTiles(
                icon: Icon(Icons.share),
                text: 'Invite Friends',
              ),
            ),
            InkWell(
              onTap: () {},
              child: const SettingsTiles(
                icon: Icon(Icons.shield_outlined),
                text: 'Privacy Policy',
              ),
            ),
            InkWell(
              onTap: () {},
              child: const SettingsTiles(
                icon: Icon(Icons.note),
                text: 'Terms & Conditions',
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Do you want to logout?',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  Auth(context: context).firebasesignout();
                                },
                                child: const Text('Yes'),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const SettingsTiles(
                icon: Icon(Icons.logout),
                text: 'Logout',
              ),
            )
          ],
        ),
      ),
    ));
  }
}

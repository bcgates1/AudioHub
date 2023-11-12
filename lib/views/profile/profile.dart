import 'package:audiohub/service/firebase/fetchdata.dart';
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
      child: FutureBuilder(
        future: FetchDataFirebase.fetchUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
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
                    ),
                  )
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
                        backgroundImage: snapshot.data!.image.isEmpty
                            ? AssetImage('assets/images/unknown.jpg') as ImageProvider
                            : NetworkImage(snapshot.data!.image),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  UserDataBox(title: 'Name', data: snapshot.data!.name),
                  UserDataBox(title: 'Email', data: snapshot.data!.email),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

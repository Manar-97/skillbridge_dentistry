import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/widgets/listtilewidget.dart';

class ConsultantProfileScreen extends StatefulWidget {
  const ConsultantProfileScreen({super.key});
  static const String routeName = 'profile';
  @override
  State<ConsultantProfileScreen> createState() => _ConsultantProfileScreenState();
}

class _ConsultantProfileScreenState extends State<ConsultantProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.getFont('Inter',
              color: const Color(0xFF13122B),
              fontSize: 22,
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/types of categories2.png'),
              radius: 80,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              'Dr/ Mohamed Ahmed',
              style: GoogleFonts.getFont('Inter',
                  fontSize: 20, color: const Color(0xFF13122B)),
            ),
            Text(
              'ahmdohame242@gmail.com',
              style: GoogleFonts.getFont('Inter',
                  fontSize: 16, color: const Color(0xFF9E9E9E)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ListTileWidget(
              icon: Icons.person_outline,
              text: 'Edit Profile',
              onTap: () {},
            ),
            ListTileWidget(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {},
            ),
            // ListTileWidget(
            //   icon: Icons.wallet,
            //   text: 'My Wallet',
            //   onTap: () {},
            // ),
            ListTileWidget(
              icon: Icons.feedback,
              text: 'FAQs',
              onTap: () {},
            ),
            ListTileWidget(
              icon: Icons.logout,
              text: 'Log Out',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

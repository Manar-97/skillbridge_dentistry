import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';
import 'consul_camera/consul_camera.dart';
import 'consul_home/consul_home.dart';
import 'consul_profile/consultant_profile.dart';

class MainConsultantScreen extends StatefulWidget {
  const MainConsultantScreen({super.key});
  static const String routeName = 'mainconsul';

  @override
  State<MainConsultantScreen> createState() => _MainConsultantScreenState();
}

class _MainConsultantScreenState extends State<MainConsultantScreen> {
  int _selectedIndex = 0;
  Widget currentTab = const ConsultantHome();
  List<Widget> tabs = [
    const ConsultantHome(),
    const ConsultantCases(),
    const ConsultantProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _selectedIndex = index;
            setState(() {});
          },
          backgroundColor: const Color(0xFFC9DFDD),
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: const Color(0xFF717070),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 25,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.network_cell), label: 'Level'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile')
          ]),
      body: tabs[_selectedIndex],
    );
  }
}

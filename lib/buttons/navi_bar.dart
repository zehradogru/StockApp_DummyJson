import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:list_app/pages/home_page.dart';
import 'package:list_app/pages/profile_page.dart';

import '../pages/user_page.dart';


class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {

  List pages = [
    const HomePage(),
    const UserPage(),
    const ProfilePage(),
  ];
  int current = 0;
  void onTap(int index) {
    setState(() {
      current = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current],

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color:Colors.white,

            boxShadow: [
              BoxShadow(
                blurRadius:20,
                color: Colors.white,
              )

            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: GNav(
            //rippleColor: Colors.grey, // tab button ripple color when pressed
            mainAxisAlignment: MainAxisAlignment.center,
            //hoverColor: Colors.grey, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 24,

            tabActiveBorder: Border.all(color: Colors.black38), // tab button border
            //tabBorder: Border.all(color: Colors.black26), // tab button border
            tabShadow: [
              BoxShadow(color: Colors.white30.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            //curve: Curves.easeOutExpo, // tab animation curves
            //duration: const Duration(milliseconds: 900), // tab animation duration
            gap: 22, // the tab button gap between icon and text
            color: Colors.black26, // unselected icon color
            activeColor: Colors.grey[700], // selected icon and text color

            iconSize: 25, // tab button icon size
            tabBackgroundColor: Colors.grey.shade300.withOpacity(0.1), // selected tab background color
            tabs: const [
              GButton(
                icon: Icons.point_of_sale,
                text: 'Stocks',
              ),
              GButton(
                icon: Icons.person,
                text: 'Users',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
            selectedIndex: current,
            onTabChange: (index) {
              setState(() {
                current = index;
              });
            },
          ),

        ),
      ),

    );
  }
}
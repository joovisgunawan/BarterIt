import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'homescreen.dart';
import 'postscreen.dart';
import 'notificationscreen.dart';
import 'profilescreen.dart';
import '../userobject/user.dart';

class LandingScreen extends StatefulWidget {
  final User user;
  const LandingScreen({super.key, required this.user});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;
  final tabs = const [
    HomeScreen(),
    PostScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000022),
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            backgroundColor: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.indigo,
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add,
                text: 'Post',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notification',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            onTabChange: (value) {
              _currentIndex = value;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    Center(
      child: Text('home'),
    ),
    Center(
      child: Text('search'),
    ),
    Center(
      child: Text('home'),
    ),
    Center(
      child: Text('search'),
    )
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              text: "home",
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTab(
              text: "discover",
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            NavTab(
              text: "inbox",
              icon: FontAwesomeIcons.inbox,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavTab(
              text: "profile",
              icon: FontAwesomeIcons.user,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}

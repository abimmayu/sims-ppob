import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sims_ppob_abim/core/router/page_router.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    super.key,
    this.currentIndex = 0,
  });

  int currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: widget.currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.money_outlined),
          activeIcon: Icon(Icons.money),
          label: 'Top Up',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_outlined),
          activeIcon: Icon(Icons.credit_card),
          label: 'Transaction',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });

    switch (index) {
      case 0:
        context.goNamed(AppRoute.homeScreen.name);
        break;
      case 1:
        context.goNamed(AppRoute.topupScreen.name);
        break;
      case 2:
        context.goNamed(AppRoute.historyScreen.name);
        break;
      case 3:
        context.goNamed(AppRoute.profileScreen.name);
        break;
    }
  }
}

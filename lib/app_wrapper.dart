import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppWrapper({super.key, required this.navigationShell});

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            label: 'Today',
            icon: Icon(Icons.today),
          ),
          BottomNavigationBarItem(
            label: 'For You',
            icon: Icon(Icons.star),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

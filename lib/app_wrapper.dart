import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          'NewsPoint',
          style: TextStyle(
            fontFamily: GoogleFonts.merriweather().fontFamily,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // NewsRepository().fetchAllNews();
              // NewsRepository().fetchForYouNews();
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            label: 'Today',
            icon: Icon(Icons.newspaper),
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

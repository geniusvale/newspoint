import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

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
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
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
        selectedItemColor: Colors.black,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: 'Today',
            icon: Icon(Remix.article_line),
          ),
          BottomNavigationBarItem(
            label: 'For You',
            icon: Icon(Remix.star_smile_line),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Remix.settings_line),
          ),
        ],
      ),
    );
  }
}

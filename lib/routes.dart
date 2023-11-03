import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newspoint/app_wrapper.dart';
import 'package:newspoint/model/articlemodel.dart';
import 'package:newspoint/screens/foryou.dart';
import 'package:newspoint/screens/news_detail.dart';
import 'package:newspoint/screens/settings.dart';
import 'package:newspoint/screens/today.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey();

final routes = GoRouter(
  navigatorKey: navKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: navKey,
      builder: (context, state, navigationShell) {
        return AppWrapper(navigationShell: navigationShell);
      },
      branches: [
        //TODAY TAB
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'today',
              path: '/',
              builder: (context, state) => const TodayScreen(),
            ),
          ],
        ),
        //FYP TAB
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'foryou',
              path: '/foryou',
              builder: (context, state) => const ForYouScreen(),
            ),
          ],
        ),
        //SETTINGS TAB
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'settings',
              path: '/settings',
              builder: (context, state) => const SettingScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: navKey,
      name: 'detail',
      path: '/detail',
      builder: (context, state) {
        ArticleModel newsData = state.extra as ArticleModel;
        return NewsDetailScreen(data: newsData);
      },
    ),
  ],
);

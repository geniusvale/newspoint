import 'package:go_router/go_router.dart';
import 'package:newspoint/app_wrapper.dart';
import 'package:newspoint/screens/foryou.dart';
import 'package:newspoint/screens/settings.dart';
import 'package:newspoint/screens/today.dart';

final routes = GoRouter(
  initialLocation: '/today',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppWrapper(navigationShell: navigationShell);
      },
      branches: [
        //TODAY TAB
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'today',
              path: '/today',
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
  ],
);

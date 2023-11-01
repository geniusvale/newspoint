import 'package:flutter/material.dart';
// import 'package:newspoint/app_wrapper.dart';
import 'package:newspoint/routes.dart';

import 'themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
      title: 'NewsPoint',
      theme: appTheme,
    );
  }
}

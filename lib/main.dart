import 'package:flutter/material.dart';
import 'package:newspoint/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/news_for_you_bloc.dart';
import 'bloc/news_today_bloc.dart';
import 'themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsTodayBloc()..add(FetchNewsToday()),
        ),
        BlocProvider(
          create: (context) => NewsForYouBloc()..add(FetchNewsForYou()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: routes,
        debugShowCheckedModeBanner: false,
        title: 'NewsPoint',
        theme: appTheme,
      ),
    );
  }
}

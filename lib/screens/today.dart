import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspoint/bloc/news_today_bloc.dart';

import '../widgets/widgets.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NewsTodayBloc, NewsTodayState>(
        listener: (context, state) {
          if (state is NewsTodayError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<NewsTodayBloc>(context).add(FetchNewsToday());
          },
          child: ListView(
            // padding: const EdgeInsets.all(16),
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Fresh news happening today, worldwide.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              BlocBuilder<NewsTodayBloc, NewsTodayState>(
                builder: (context, state) {
                  if (state is NewsTodayInitial) {
                    return const Center(child: Text('Initial'));
                  } else if (state is NewsTodayLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NewsTodayError) {
                    return const Center(child: Text('ERROR'));
                  } else if (state is NewsTodayLoaded) {
                    return ListView.separated(
                      itemCount: state.newsToday.articles!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          context.push('/detail',
                              extra: state.newsToday.articles![index]);
                        },
                        child: NewsCard(
                          article: state.newsToday.articles,
                          index: index,
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: Text('I Don\'t Know'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

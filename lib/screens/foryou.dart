import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/news_for_you_bloc.dart';
import '../widgets/widgets.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NewsForYouBloc, NewsForYouState>(
        listener: (context, state) {
          if (state is NewsForYouError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<NewsForYouBloc>(context).add(FetchNewsForYou());
          },
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Personalized news, only for you.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              BlocBuilder<NewsForYouBloc, NewsForYouState>(
                builder: (context, state) {
                  if (state is NewsForYouInitial) {
                    return const Center(child: Text('Initial'));
                  } else if (state is NewsForYouLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NewsForYouError) {
                    return const Center(child: Text('ERROR'));
                  } else if (state is NewsForYouLoaded) {
                    return ListView.separated(
                      itemCount: state.newsForYou.articles!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          context.push('/detail',
                              extra: state.newsForYou.articles![index]);
                        },
                        child: NewsCard(
                          index: index,
                          article: state.newsForYou.articles,
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

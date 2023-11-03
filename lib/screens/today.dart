import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspoint/bloc/news_today_bloc.dart';
import 'package:newspoint/model/articlemodel.dart';

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
        child: ListView(
          // padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Fresh news happening today, worldwide.',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  fontFamily: GoogleFonts.lato().fontFamily,
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
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) => NewsCard(
                      article: state.newsToday,
                      index: index,
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
    );
  }
}

class NewsCard extends StatelessWidget {
  final List<ArticleModel>? article;
  final int index;
  const NewsCard({
    super.key,
    this.article,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article?[index].title ?? 'No Title',
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  article?[index].description ?? 'No Desc',
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  article?[index].content ?? 'No Content',
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              article?[index].urlToImage ?? 'https://picsum.photos/200/300',
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                width: 120,
                height: 120,
                child: Icon(
                  Icons.error,
                ),
              ),
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

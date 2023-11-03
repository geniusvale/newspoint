import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../model/articlemodel.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article?[index].title ?? 'No Title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  article?[index].description ?? 'Read More',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                // Text(
                //   article?[index].content ?? 'No Content',
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ClipRRect(
            child: article?[index].urlToImage != null
                ? Image.network(
                    height: 120,
                    width: 120,
                    article![index].urlToImage!,
                    headers: const {
                      'Referrer-Policy': 'no-referrer',
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(
                      width: 120,
                      height: 120,
                      child: Icon(
                        Remix.error_warning_line,
                      ),
                    ),
                  )
                : const Center(),
          ),
        ],
      ),
    );
  }
}

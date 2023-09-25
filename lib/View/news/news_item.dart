import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../changenotifier/news_change_notifier.dart';
import '../../core/model/News.dart';

class NewsItem extends StatelessWidget {
  // const NewsItem({Key? key}) : super(key: key);
  News news;

  NewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsChangeNotifier>(context);
    Duration duration =
        DateTime.now().toUtc().difference(DateTime.parse(news.publishedAt!));
    print(DateTime.now());
    print(DateTime.parse(news.publishedAt!));
    print(duration);
    return InkWell(
      onTap: () {
        newsProvider.changeNews(news);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(15),
              child:
                  // Image.network(news.urlToImage??"", height: 200,)
                  CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              news.source!.name!.toUpperCase(),
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Color(0xff79828B),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              news.title!,
              style: const TextStyle(color: Color(0xFF42505C)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(news.author ?? ""),
            Text(
              "${(duration.inHours ~/ 24)} day , ${duration.inHours % 24 > 0 ? duration.inHours % 24 : ""} ${duration.inHours % 24 > 0 ? " hour" : ""} ago",
              textAlign: TextAlign.end,
              style: const TextStyle(color: Color(0xFFA3A3A3)),
            ),

            // Text(news.publishedAt!, textAlign: TextAlign.end,),
          ],
        ),
      ),
    );
  }
}

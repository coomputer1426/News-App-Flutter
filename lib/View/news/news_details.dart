import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../changenotifier/news_change_notifier.dart';

class NewsItemDetails extends StatelessWidget {
  const NewsItemDetails({Key? key}) : super(key: key);

  // News news;
  // NewsItemDetails(this.news);
  @override
  Widget build(BuildContext context) {
    print(DateTime.now());
    // print(DateTime.parse(news.publishedAt!));
    return Consumer<NewsChangeNotifier>(
        builder: (context, newsproviderConsumer, child) {
      Duration duration = DateTime.now()
          .toUtc()
          .difference(DateTime.parse(newsproviderConsumer.news!.publishedAt!));
      print(duration);
      debugPrint(newsproviderConsumer.news!.content);
      debugPrint(newsproviderConsumer.news!.description);

      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(15),
              child:
                  // Image.network(news.urlToImage??"", height: 200,)
                  CachedNetworkImage(
                imageUrl: newsproviderConsumer.news!.urlToImage ?? "",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              newsproviderConsumer.news!.source!.name!.toUpperCase(),
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Color(0xff79828B),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              newsproviderConsumer.news!.title!,
              style: const TextStyle(color: Color(0xFF42505C)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(newsproviderConsumer.news!.author ?? ""),
            Text(
              "${(duration.inHours ~/ 24)} day , ${duration.inHours % 24 > 0 ? duration.inHours % 24 : ""} ${duration.inHours % 24 > 0 ? " hour" : ""} ago",
              textAlign: TextAlign.end,
              style: TextStyle(color: Color(0xFFA3A3A3)),
            ),
            Text(
              newsproviderConsumer.news!.description!,
            ),
            InkWell(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("View Fulll Article outside App"),
                  Icon(Icons.arrow_right)
                ],
              ),
              onTap: () async {
                debugPrint(newsproviderConsumer.news!.url!);
                String url = newsproviderConsumer.news!.url!;
                if (!await launchUrl(Uri.parse(url),
                    mode: LaunchMode.inAppWebView)) {
                  throw Exception(
                      'Could not launch ${newsproviderConsumer.news!.url!}');
                }
              },
            ),
            InkWell(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("View Fulll Article inside App"),
                  Icon(Icons.arrow_right)
                ],
              ),
              onTap: () {
                newsproviderConsumer.changeActions(2);
                newsproviderConsumer.changeBodyWidgetIndex(5);
              },
            ),
          ],
        ),
      );
    });
  }
}

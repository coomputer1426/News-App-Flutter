
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../changenotifier/news_change_notifier.dart';
import '../../core/api_manager.dart';
import '../../core/model/NewsResponse.dart';
import '../home/home_body.dart';
import '../news/news_item.dart';


class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsChangeNotifier>(
        builder: (context, newsproviderConsumer, child) {


          return Container(decoration: imageDecoration(),
            child:
            FutureBuilder<NewsResponse>(
              future: ApiManager.getSearchArticles(
                  newsproviderConsumer.searchTerm,
                  categoryId: newsproviderConsumer.selectedcategory!=null ? newsproviderConsumer.selectedcategory!.categoryID:
                  ""),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(),);
                }
                // if there is network problem
                else if (snapshot.hasError) {
                  {
                    return Center(child: Text(
                      "Error Loading Data ${snapshot.error.toString()}",
                      style: TextStyle(fontSize: 20),),);
                  }
                }
                // if there is keys and header wrong
                else if (snapshot.data!.status == "error") {
                  return Center(child: Center(
                    child: Text("Server Error ${snapshot.data!.message}"),),);
                }
                var newsList = snapshot.data?.newsList;
                  debugPrint("result count ${newsList!.length.toString()}");
                return ListView.builder(itemBuilder: (context, index) {
                  return NewsItem(newsList[index]);
                }, itemCount: newsList!.length,);
              },
            ),)
          ;
        }
      );
  }
}

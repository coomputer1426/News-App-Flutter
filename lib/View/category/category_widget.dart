import 'package:flutter/material.dart';
import 'package:news_app_route_bloc_clean_arch/View/category/category_tabs_widget.dart';
import 'package:news_app_route_bloc_clean_arch/View/home/home_body.dart';
import 'package:provider/provider.dart';

import '../../../changenotifier/news_change_notifier.dart';
import '../../../core/api_manager.dart';
import '../../../core/model/SourcesResponse.dart';

class CategoryNewsList extends StatelessWidget {
  // const CategoryNewsList({Key? key}) : super(key: key);
  // Category? category;
  // CategoryNewsList({this.category});
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsChangeNotifier>(
      builder: (context, newsprovider, child) => Container(
        decoration: imageDecoration(),
        child: FutureBuilder<SourcesResponse>(
          future:
              ApiManager.getSources(newsprovider.selectedcategory!.categoryID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              {
                return Center(
                  child: Text(
                    "Error Loading Data ${snapshot.error.toString()}",
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }
            } else if (snapshot.data!.status == "error") {
              return Center(
                child: Center(
                  child: Text("Server Error ${snapshot.data!.message}"),
                ),
              );
            }
            var sources = snapshot.data?.sources;
            return CategoryTabsWidget(sources!);
            //   ListView.builder(itemBuilder: (_, index){
            //   debugPrint("Length is ${sources!.length}");
            //    return Text("Source No ${index} is ${sources?[index].name}",
            //    style: TextStyle(fontSize: 20),);
            // }, itemCount: sources?.length?? 0,);
          },
        ),
      ),
    );
  }
}

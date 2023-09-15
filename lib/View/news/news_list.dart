
import 'package:flutter/material.dart';
import 'package:news_app_route_bloc_clean_arch/View/home/home_body.dart';
import '../../core/api_manager.dart';
import '../../core/model/NewsResponse.dart';
import '../../core/model/Source.dart';
import 'news_item.dart';

class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(decoration: imageDecoration(),
      child:
      FutureBuilder<NewsResponse>(
        future: ApiManager.getSourceCatNews(source.id??""),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
          {return const Center(child: const CircularProgressIndicator(),);}
          else if (snapshot.hasError){
            {return Center(child: Text("Error Loading Data ${snapshot.error.toString()}",
              style: const TextStyle(fontSize: 20),),);}
          }
          else if(snapshot.data!.status=="error"){
            return Center(child: Center(child: Text("Server Error ${snapshot.data!.message}"),),);
          }
          var newsList = snapshot.data?.newsList;
          return ListView.builder(itemBuilder: (context, index){
            return NewsItem(newsList[index]);
          }, itemCount: newsList!.length,);
        },
      ),
    );
  }
}

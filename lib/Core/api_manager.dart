
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/NewsResponse.dart';
import 'model/SourcesResponse.dart';
class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "794f97ece9e942ffbbfa6147ddfd0fd0";

  static Future<SourcesResponse> getSources(String categoryId)async{
    // uri https named contstructor https://
    // unencoded path /v2/top-headlines/sources
    // authority newsapi.org
    var url = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      "apiKey": apiKey,
      "category" : categoryId
    });
    //  https://newsapi.org/v2/top-headlines/sources?apiKey=794f97ece9e942ffbbfa6147ddfd0fd0&category=sports
    var response = await http.get(url);
    // var bodyString = response.body;
    // var json = jsonDecode(bodyString);
    return SourcesResponse.fromJson(jsonDecode(response.body));

  }
  //  https://newsapi.org/v2/everything?apiKey=794f97ece9e942ffbbfa6147ddfd0fd0&sources=bbc-sport
  static Future<NewsResponse> getSourceCatNews(String sourceId)async{
    var url = Uri.https(baseUrl, "/v2/everything", {
      "apiKey" : apiKey, "sources" : sourceId
    });
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
  static Future<NewsResponse> getSearchArticles(String searchText, {String categoryId =""})async{
    var url = categoryId!="" ? Uri.https(baseUrl, "/v2/everything", {
      "apiKey" : apiKey, "q" : searchText,
      "from" : "2023-05-14" , "sortBy" : "popularity"

      }
    ): Uri.https(baseUrl, "/v2/everything", {
      "apiKey" : apiKey, "q" : searchText, "category" : categoryId,
      "from" : "2023-05-14" , "sortBy" : "popularity"

    }
    );
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
import 'package:flutter/material.dart';
import 'package:news_app_route_bloc_clean_arch/View/home/category_grid_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../core/model/News.dart';
import '../View/category/search_widget.dart';
import '../View/news/news_details.dart';
import 'package:news_app_route_bloc_clean_arch/View/app_bars.dart';
import 'package:news_app_route_bloc_clean_arch/View/actions.dart';
import '../View/news/web_view.dart';
import '../View/settings/language_bottom_sheet.dart';
import '../View/home/home_view.dart';
import '../View/category/category_widget.dart';
import '../View/home/home_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsChangeNotifier extends ChangeNotifier {
  String currentLocale = "en";
  bool isEnglish() {
    return currentLocale == "en";
  }

  static List<String> arlangs = ["العربية", "الإنجليزية"];
  static List<String> enlangs = ["Arabic", "English"];
  String dropdownlan = "English";
  List<String> langList = enlangs;
  static List<Category> categories = [
    Category(
        categoryID: "sports",
        // categoryID: AppLocalizations.of(.sports,
        categoryImage: "assets/images/sports.png",
        categoryTitle: "Sports",
        categoryBackground: const Color.fromARGB(255, 201, 28, 34)),
    Category(
        categoryID: "general",
        categoryImage: "assets/images/Politics.png",
        categoryTitle: "Politics",
        categoryBackground: const Color.fromARGB(255, 0, 62, 144)),
    Category(
        categoryID: "health",
        categoryImage: "assets/images/health.png",
        categoryTitle: "Health",
        categoryBackground: const Color.fromARGB(255, 237, 30, 121)),
    Category(
        categoryID: "business",
        categoryImage: "assets/images/business.png",
        categoryTitle: "Business",
        categoryBackground: const Color.fromARGB(255, 207, 126, 72)),
    Category(
        categoryID: "technology",
        categoryImage: "assets/images/enviroment.png",
        categoryTitle: "Technology",
        categoryBackground: const Color.fromARGB(255, 72, 130, 207)),
    Category(
        categoryID: "entertainment",
        categoryImage: "assets/images/enviroment.png",
        categoryTitle: "Entertainment",
        categoryBackground: const Color.fromARGB(255, 72, 130, 207)),
    Category(
        categoryID: "science",
        categoryImage: "assets/images/science.png",
        categoryTitle: "Science",
        categoryBackground: const Color.fromARGB(255, 242, 211, 82)),
  ];
  static List<String> arCategTitles = ["الرياضية", "السياسية", "الصحية", "الأعمال", "البيئية", "العلمية" ];
  static List<String> enCategTitles = ["Sports", "Politics", "Health", "Business",
    "Enviroment", "Science"];
  static List<String> catTitles = enCategTitles;

  static List<Category> categoriesAr = [
    Category(
        categoryID: "sports",
        categoryImage: "assets/images/sports.png",
        categoryTitle: "الرياضية",
        categoryBackground: const Color.fromARGB(255, 201, 28, 34)),
    Category(
        categoryID: "general",
        categoryImage: "assets/images/Politics.png",
        categoryTitle: "السياسية",
        categoryBackground: const Color.fromARGB(255, 0, 62, 144)),
    Category(
        categoryID: "health",
        categoryImage: "assets/images/health.png",
        categoryTitle: "الصحية",
        categoryBackground: const Color.fromARGB(255, 237, 30, 121)),
    Category(
        categoryID: "business",
        categoryImage: "assets/images/business.png",
        categoryTitle: "الأعمال",
        categoryBackground: const Color.fromARGB(255, 207, 126, 72)),
    Category(
        categoryID: "technology",
        categoryImage: "assets/images/enviroment.png",
        categoryTitle: "التقنية",
        categoryBackground: const Color.fromARGB(255, 72, 130, 207)),
    Category(
        categoryID: "entertainment",
        categoryImage: "assets/images/enviroment.png",
        categoryTitle: "الترفيه",
        categoryBackground: const Color.fromARGB(255, 72, 130, 207)),
    Category(
        categoryID: "science",
        categoryImage: "assets/images/science.png",
        categoryTitle: "العلمية",
        categoryBackground: const Color.fromARGB(255, 242, 211, 82)),
  ];


  void changeLocale(String newLocale) {
    if(currentLocale == newLocale){return;}
    currentLocale = newLocale;
    changeCategoryList(newLocale);
    if(newLocale =="ar"){changeAppBarTitle(appBar_Title:"الإعدادات");
      langList = arlangs;
      dropdownlan ="العربية";
    }
    else if(newLocale == "en"){changeAppBarTitle(appBar_Title:"Settings");
      langList = enlangs;
      dropdownlan ="English";

      }
    notifyListeners();
  }
  var catlist = categories;
  void changeCategoryList(String locale){
    if (locale == "ar") {catlist = categoriesAr; notifyListeners();}
    if (locale == "en") {catlist = categories; notifyListeners();}

  }


  int appBarTitleIndex = 0;
  static const TextStyle appBarTitleStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 22);
  Widget appBarTitle= const Text("Route News App", style: appBarTitleStyle);
  List<Widget> bodytabs = [
    BodyView(),
    CategoryNewsList(),
    const LanguageButtomSheet(),
    const SearchWidget(),
    const NewsItemDetails(),
    WebViewStack()
  ];
  News? news;
  void changeNews(News selectedNews){
    news = selectedNews;
    changeAppBarTitle(appBar_Title:selectedNews.title!, appBarStyle: TextStyle(fontSize: 17));
    changeBodyWidgetIndex(4);
    notifyListeners();
  }
  Widget actions = SearchButtonAction();
  int selectedbodyIndex = 0;
  Widget bodyWidget = BodyView();
  void changeAppBarTitle({String appBar_Title="", TextStyle appBarStyle = appBarTitleStyle}) {
    if(appBar_Title=="Search"){
      appBarTitle = appBartitleWidget();
      // changeActions(2);
    }
    else {
      appBarTitle = Text(appBar_Title, style: appBarStyle)
        ;
    }
    notifyListeners();
  }
  String searchTerm ="";

  void changeSearch(String search){
    searchTerm= search;
    changeBodyWidgetIndex(3);
    notifyListeners();
  }
  // void changeAppBarText(Widget widget) {}


  Category? selectedcategory;
  var actionslistsList = [
    Container(),
    SearchButtonAction(),
    NavigationControls(),
  ];


  void changeActions(int index){
    actions = actionslistsList[index];
    notifyListeners();

  }
  WebViewController controller = WebViewController();

  void changeSelectedWidget(Category category) {
    // changeAppBarTitle(category == null? "Route News App" : category!.CategotyTitle);
    selectedcategory = category;
    notifyListeners();
  }

  void changeBodyWidgetIndex(int index) {
    // selectedbodyIndex = index;
    bodyWidget = bodytabs[index];
    notifyListeners();
  }
}

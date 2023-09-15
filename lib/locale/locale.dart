import 'package:get/get.dart';

class MyLocale implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>
      // throw UnimplementedError();
  {
    "ar" : {"1" : "الصفحة الرئيسية", "2" : "الإعدادات", "3": "العربية",
      "4" : "المجموعات", "newsApp" : "تطبيق الأخبار", "5" : "الرياضية", "6" : "تطبيق الأخبار رووت",
      "7" : "السياسية",  "8": "الصحية", "9" : "الأعمال" , "10" : "البيئة" , "11" : "العلمية"},
    "en" : {"1" : "Home Page", "2" : "Settings", "3" : "Arabic",
        "4" : "Categories", "newsApp" : "News App", "5" : "Sports", "6" : "Route News App",
    "7" : "Politics", "8": "Health", "9" : "Business" , "10" : "Enviroment" , "11" :"Science"}
  };
}
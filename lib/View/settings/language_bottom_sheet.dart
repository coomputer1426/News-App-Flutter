import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../changenotifier/news_change_notifier.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../locale/locale_controller.dart';


class LanguageButtomSheet extends StatefulWidget {
  const LanguageButtomSheet({Key? key}) : super(key: key);
  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    // List<String> langs = [AppLocalizations.of(context)!.arabic,
    //   AppLocalizations.of(context)!.english];
    // MyLocalController langcontroller = Get.find();
    var newsProvider = Provider.of<NewsChangeNotifier>(context);
    return Container(padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(AppLocalizations.of(context)!.lang, style: TextStyle(fontSize: 25),),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
        Consumer<NewsChangeNotifier>(builder: (context, newsproviderConsumer, child)=>
        Container(decoration: BoxDecoration(border: Border.all(width: 2,color: Color(0xff39A552)), ),
          padding: EdgeInsets.all(2),
          child: InkWell(onTap: (){newsproviderConsumer.changeLocale("ar");
          // newsproviderConsumer.changeCategoryList("ar");
          // if(newsProvider.currentLocale != "ar")
          // langcontroller.changeLanguageGetx("ar");
          // newsproviderConsumer.changeCategoryTitle(0, "5".tr);
          // newsProvider.changeAppBarTitle("الإعدادات");
          // String ee = AppLocalizations.of(context)!.health;
          // debugPrint(AppLocalizations.of(context)!.health);
          // newsproviderConsumer.changeCategoryTitle(1, "7".tr);
          // newsproviderConsumer.changeCategoryTitle(2, AppLocalizations.of(context)!.health);
          // newsproviderConsumer.changeCategoryTitle(2, "8".tr);
          // newsproviderConsumer.changeCategoryTitle(3, AppLocalizations.of(context)!.business);
          // newsproviderConsumer.changeCategoryTitle(3, "9".tr);
          // newsproviderConsumer.changeCategoryTitle(4, AppLocalizations.of(context)!.enviroment);
          // newsproviderConsumer.changeCategoryTitle(4, "10".tr);
          // newsproviderConsumer.changeCategoryTitle(5, AppLocalizations.of(context)!.science);
          // newsproviderConsumer.changeCategoryTitle(5, "11".tr);
          },
              child: newsProvider.isEnglish()?
              getUnselectedItem(
                  AppLocalizations.of(context)!.arabic
              )
                  :
              getSelectedItem(
                 AppLocalizations.of(context)!.arabic
              )
           ),
        )
          ,)
        ,
        SizedBox(height: 8,),
        Container(decoration: BoxDecoration(border: Border.all(width: 2,color: Color(0xff39A552)), ),
          padding: EdgeInsets.all(2),
          child: InkWell(onTap: (){newsProvider.changeLocale("en");
            // newsProvider.changeCategoryList("en");
          // if(newsProvider.currentLocale != "en")

          // langcontroller.changeLanguageGetx("en");
          // newsProvider.changeAppBarTitle("2".tr);
          // newsProvider.changeAppBarTitle("Settings");
            // newsProvider.categories[0].CategoryTitle = AppLocalizations.of(context)!.sports;
            // newsProvider.categories[1].CategoryTitle = AppLocalizations.of(context)!.politics;
            // newsProvider.categories[2].CategoryTitle = AppLocalizations.of(context)!.health;
            // newsProvider.categories[3].CategoryTitle = AppLocalizations.of(context)!.business;
            // newsProvider.categories[4].CategoryTitle = AppLocalizations.of(context)!.enviroment;
            // newsProvider.categories[5].CategoryTitle = AppLocalizations.of(context)!.science;
            } ,
              child: newsProvider.isEnglish()?getSelectedItem(
                   AppLocalizations.of(context)!.english)
                  : getUnselectedItem(
                AppLocalizations.of(context)!.english
              )
          ),
        ),
        const SizedBox(height: 10,),
            ],),
        ),
        Text(AppLocalizations.of(context)!.lang, style: TextStyle(fontSize: 25),),
        const SizedBox(height: 10,),
        Consumer<NewsChangeNotifier>(builder: (context, newsConsumer, child)=>
        Container(decoration: BoxDecoration(border: Border.all(width: 2,color: Color(0xff39A552)), ),
          padding: EdgeInsets.all(2),
          // decoration: BoxDecoration(border: ),
          child: DropdownButton<String>(value: newsConsumer.dropdownlan,
              items: newsConsumer.langList.map<DropdownMenuItem<String>>((String e) =>
                DropdownMenuItem(
                  value: e,
                  child: Text(e, style: TextStyle(fontSize: 25),),
                )).toList(),
              onChanged: (String? newValue){
                if(newValue ==newsConsumer.langList[0])
                  {newsConsumer.changeLocale("ar");}
                  else {newsConsumer.changeLocale("en");}
              },
              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF39A552),),
              isExpanded: true,
              iconSize: 40,
            
              style: TextStyle(color: Color(0xFF39A552)),
                ),
        ),
        )
      ],),);
  }

  Widget getSelectedItem(String title){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title, style: const TextStyle(fontSize: 23))
        ,

        const Icon(Icons.check,color: Color(0xFF39A552),
         )
      ],
    );
  }

  Widget getUnselectedItem(String title){
    return Text(title, style: TextStyle(fontSize: 23),
      // style: Theme.of(context).textTheme.headline4?.copyWith(color: MyTheme.lightGrey),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:news_app_route_bloc_clean_arch/locale/locale_controller.dart';
import 'package:provider/provider.dart';

import '../../changenotifier/news_change_notifier.dart';
import 'category_grid_view.dart';

class HomeView extends StatelessWidget {
  static const routeName = "homeView";

  @override
  Widget build(BuildContext context) {
    MyLocalController langcontroller = Get.find();

    var newsprovider = Provider.of<NewsChangeNotifier>(context);
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Consumer<NewsChangeNotifier>(
            builder: (context, newsproviderConsumer, child) =>
                newsproviderConsumer.appBarTitle,
            // selectedCategory==null?
            // "Route News App":
            // AppLocalizations.of(context)!.route_app:
            //     selectedCategory!.CategotyTitle,

            // )
          ),
          centerTitle: true,
          elevation: 1,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          actions: [
            Consumer<NewsChangeNotifier>(
                builder: (context, newsproviderConsumer, child) =>
                    newsproviderConsumer.actions),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 110,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Text(
                    // "News App!",
                    // "newsApp".tr,
                    AppLocalizations.of(context)!.route_app,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Consumer<NewsChangeNotifier>(
                  builder: (context, newsconsprovider, child) => ListTile(
                        onTap: () {
                          newsconsprovider.changeBodyWidgetIndex(0);
                          // newsprovider.changeAppBarTitle("6".tr);
                          newsprovider.changeAppBarTitle(
                              appBar_Title:
                                  AppLocalizations.of(context)!.route_app);
                          newsprovider.changeActions(0);
                          // List<String> catList = AppLocalizations.of(context)!.catslist.split(":");
                          // for(int i = 0; i<catList.length; i++){
                          //   newsconsprovider.changeCategoryTitle(i, catList[i]);
                          // }
                          Navigator.pop(context);
                        },
                        leading: const Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.categories,
                          // "4".tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      )),
              Consumer<NewsChangeNotifier>(
                builder: (context, newsconsprovider, child) => ListTile(
                  leading: const Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  onTap: () {
                    newsconsprovider.changeBodyWidgetIndex(2);
                    newsprovider.changeAppBarTitle(
                        appBar_Title:
                            // "Settings"
                            AppLocalizations.of(context)!.settings);
                    Navigator.pop(context);
                  },
                  title: Text(
                    // "2".tr,
                    AppLocalizations.of(context)!.settings,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: newsprovider.bodyWidget
        // : [
        //     // CategoryNewsList(category: selectedCategory!),
        //     // CategoryNewsList(category: newsproviderConsumer.selectedcategory!),
        //   ]

        );
  }

  Category? selectedCategory;
}

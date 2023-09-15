import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../changenotifier/news_change_notifier.dart';
import 'category_grid_view.dart';

class BodyView extends StatelessWidget {
  BodyView({Key? key}) : super(key: key);

  // List<Category> categories = [
  //   Category(
  //       categoryID: "Sports",
  //       // categoryID: AppLocalizations.of(.sports,
  //       CategoryImage: "assets/images/sports.png",
  //       CategoryTitle: "Sports",
  //       categoryBackground: const Color.fromARGB(255, 201, 28, 34)),
  //   Category(
  //       categoryID: "General",
  //       CategoryImage: "assets/images/Politics.png",
  //       CategoryTitle: "Politics",
  //       categoryBackground: const Color.fromARGB(255, 0, 62, 144)),
  //   Category(
  //       categoryID: "Health",
  //       CategoryImage: "assets/images/health.png",
  //       CategoryTitle: "Health",
  //       categoryBackground: const Color.fromARGB(255, 237, 30, 121)),
  //   Category(
  //       categoryID: "Business",
  //       CategoryImage: "assets/images/business.png",
  //       CategoryTitle: "Business",
  //       categoryBackground: const Color.fromARGB(255, 207, 126, 72)),
  //   Category(
  //       categoryID: "Enviroment",
  //       CategoryImage: "assets/images/enviroment.png",
  //       CategoryTitle: "Enviroment",
  //       categoryBackground: const Color.fromARGB(255, 72, 130, 207)),
  //   Category(
  //       categoryID: "Science",
  //       CategoryImage: "assets/images/science.png",
  //       CategoryTitle: "Science",
  //       categoryBackground: const Color.fromARGB(255, 242, 211, 82)),
  // ];

  @override
  Widget build(BuildContext context) {
    // List<Category> categories = [
    //   Category(
    //       categoryID: "Sports",
    //       CategoryImage: "assets/images/sports.png",
    //       // CategoryTitle: "Sports",
    //       CategoryTitle: AppLocalizations.of(context)!.sports,
    //       categoryBackground: const Color.fromARGB(255, 201, 28, 34)),
    //   Category(
    //       categoryID: "General",
    //       CategoryImage: "assets/images/Politics.png",
    //       CategoryTitle: "Politics",
    //       categoryBackground: const Color.fromARGB(255, 0, 62, 144)),
    //   Category(
    //       categoryID: "Health",
    //       CategoryImage: "assets/images/health.png",
    //       CategoryTitle: "Health",
    //       categoryBackground: const Color.fromARGB(255, 237, 30, 121)),
    //   Category(
    //       categoryID: "Business",
    //       CategoryImage: "assets/images/business.png",
    //       CategoryTitle: "Business",
    //       categoryBackground: const Color.fromARGB(255, 207, 126, 72)),
    //   Category(
    //       categoryID: "Enviroment",
    //       CategoryImage: "assets/images/enviroment.png",
    //       CategoryTitle: "Enviroment",
    //       categoryBackground: const Color.fromARGB(255, 72, 130, 207)),
    //   Category(
    //       categoryID: "Science",
    //       CategoryImage: "assets/images/science.png",
    //       CategoryTitle: "Science",
    //       categoryBackground: const Color.fromARGB(255, 242, 211, 82)),
    // ];
    return Consumer<NewsChangeNotifier>(
        builder: (context, newsproviderConsumer, child) {
      return Container(
          constraints: const BoxConstraints.expand(),
          decoration: imageDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              children: [
                Text(
                  // "Pick your category \n of Interest",
                  AppLocalizations.of(context)!.pick_category,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 170,
                    childAspectRatio: 150 / 170),
                itemBuilder: (context, index) =>
                    // Consumer<NewsChangeNotifier>(builder: (context, newsproviderConsumer, child)=>
                    CategoryGridView(
                  onCategorySelected: onCategoryClick,
                  index: index,
                  category: newsproviderConsumer.catlist[index],
                )
                // )
                ,
                itemCount: newsproviderConsumer.catlist.length,
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
              ),
            ),
          ]));
    });
  }

  void onCategoryClick(Category category, BuildContext context) {
    var newsconsumerprovider =
        Provider.of<NewsChangeNotifier>(context, listen: false);
    newsconsumerprovider.changeSelectedWidget(category);
    newsconsumerprovider.changeBodyWidgetIndex(1);
    debugPrint("category is ${category.categoryID}");
    newsconsumerprovider.changeAppBarTitle(
        appBar_Title: category.categoryTitle);
    newsconsumerprovider.changeActions(1);

    // category.CategoryTitle=="Sports"?
    // AppLocalizations.of(context)!.sports:
    // category.CategoryTitle=="Science"?
    // AppLocalizations.of(context)!.science:
    // category.CategoryTitle=="Enviroment"?
    // AppLocalizations.of(context)!.enviroment:
    // category.CategoryTitle=="Health"?
    // AppLocalizations.of(context)!.health:
    // category.CategoryTitle=="Business"?
    // AppLocalizations.of(context)!.business:
    // category.CategoryTitle=="Politics"?
    // AppLocalizations.of(context)!.politics:
    // category.CategoryTitle);
    // debugPrint(newsconsumerprovider.appBarTitle);

    //   setState(() {
    //     selectedCategory = category;
    //   });
    // Consumer
  }
}

BoxDecoration imageDecoration() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage(
          "assets/images/pattern1x.png",
        ),
        fit: BoxFit.fill),
  );
}

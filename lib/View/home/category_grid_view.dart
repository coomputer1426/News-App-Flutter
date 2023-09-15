import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../changenotifier/news_change_notifier.dart';

class CategoryGridView extends StatelessWidget {
  Category category;
  int index;
  Function onCategorySelected;

  CategoryGridView(
      {Key? key,
      required this.category,
      required this.index,
      required this.onCategorySelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategorySelected(category, context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: category.categoryBackground,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
                bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              category.categoryImage,
              height: 130,
            ),
            Consumer<NewsChangeNotifier>(
                builder: (context, newsproviderConsumer, child) {
              // debugPrint("sports lang ${AppLocalizations.of(context)!.sports}");
              // if(index == 0) {newsproviderConsumer.changeCategoryTitle(index, AppLocalizations.of(context)!.sports);}
              //   else if (index == 1){ newsproviderConsumer.changeCategoryTitle(index, AppLocalizations.of(context)!.politics);}
              //   else if (index == 2){ newsproviderConsumer.changeCategoryTitle(index, AppLocalizations.of(context)!.health);}
              //   else if (index == 0){ newsproviderConsumer.changeCategoryTitle(index, AppLocalizations.of(context)!.politics);}
              //   else if (index == 0){ newsproviderConsumer.changeCategoryTitle(index, AppLocalizations.of(context)!.politics);}
              return Text(
                category.categoryTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              );
            })
          ],
        ),
      ),
    );
  }
}

class Category {
  String categoryID, categoryImage, categoryTitle;
  Color categoryBackground;

  Category({
    required this.categoryID,
    required this.categoryImage,
    required this.categoryTitle,
    required this.categoryBackground,
  });
}

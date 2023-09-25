import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../changenotifier/news_change_notifier.dart';
import '../../navigator_key.dart';
import '../settings/language_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsChangeNotifier>(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          height: 110,
          width: double.infinity,
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                // "Language"
                AppLocalizations.of(context)!.lang,
                // textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  // color: taskProvider.getThemeColor().textColor
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: InkWell(
                  onTap: () {
                    showLanguageBottomSheet();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                      border: Border.all(color: Color(0xff39A552), width: 1.5),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            newsProvider.isEnglish()
                                ? AppLocalizations.of(context)!.english
                                : AppLocalizations.of(context)!.arabic
                            // settingsProvider.isDarkMode()?AppLocalizations.of(context)!.dark: AppLocalizations.of(context)!.light
                            ,
                            // style: Theme.of(context).textTheme.headline6!.
                            // copyWith(color: MyTheme.lightPrimary),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          // color: Theme.of(context).primaryColor
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: navigatorKey.currentContext!,
        builder: (buildContext) {
          return LanguageButtomSheet();
          // return Text("data");
        });
  }
}

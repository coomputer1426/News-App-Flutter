import 'package:flutter/material.dart';
import 'package:news_app_route_bloc_clean_arch/changenotifier/news_change_notifier.dart';
import 'package:provider/provider.dart';

class SearchButtonAction extends StatelessWidget {
  const SearchButtonAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsChangeNotifier>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: IconButton(
          onPressed: () {
            newsProvider.changeAppBarTitle(appBar_Title: "Search");
            newsProvider.changeActions(0);
          },
          icon: const Icon(
            Icons.search,
            size: 40,
          ),
        ));
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls({super.key});

  // const NavigationControls({super.key});

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsChangeNotifier>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            tooltip: "Back",
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            ),
            onPressed: () async {
              final messanger = ScaffoldMessenger.of(context);
              if (await newsProvider.controller.canGoBack()) {
                await newsProvider.controller.goBack();
              } else {
                messanger.showSnackBar(const SnackBar(
                  content: Text("No Back History Item"),
                ));
              }
              return;
            }),
        IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerRight,
          tooltip: "Forward",
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
          onPressed: () async {
            final messanger = ScaffoldMessenger.of(context);
            if (await newsProvider.controller.canGoForward()) {
              await newsProvider.controller.goForward();
            } else {
              messanger.showSnackBar(const SnackBar(
                content: Text("No Forward History Item"),
              ));
            }
            return;
          },
        ),
        IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerRight,
          icon: Icon(
            Icons.replay,
            size: 18,
          ),
          tooltip: "Reload",
          onPressed: () {
            newsProvider.controller.reload();
          },
        ),
        Menu()
      ],
    );
  }
}

enum _MenuOptions {
  navigationDelegate,
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsChangeNotifier>(context);
    return PopupMenuButton<_MenuOptions>(
        onSelected: (value) async {
          switch (value) {
            case _MenuOptions.navigationDelegate:
              await newsProvider.controller
                  .loadRequest(Uri.parse("https://youtube.com"));
              break;
            default:
          }
        },
        tooltip: "Navigate to Youtube",
        itemBuilder: (context) => [
              const PopupMenuItem(
                  value: _MenuOptions.navigationDelegate,
                  child: Text("Navigate to Youtube"))
            ]);
  }

  void prevent_youtube(BuildContext context, String host) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Blocking navigation to $host",
        style: TextStyle(color: Colors.red),
      ),
      duration: Duration(seconds: 4),
    ));
  }
}

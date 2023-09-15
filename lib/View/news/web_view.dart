import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:news_app_route_bloc_clean_arch/changenotifier/news_change_notifier.dart';
import 'package:news_app_route_bloc_clean_arch/View/snack_bar.dart';

class WebViewStack extends StatefulWidget {

  const WebViewStack({super.key});

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final GlobalKey<ScaffoldMessengerState> scaffoldMessangerKey = GlobalKey<ScaffoldMessengerState>();
    var newsProvider = Provider.of<NewsChangeNotifier>(context, listen: false);
    String url = newsProvider.news!.url!;
    newsProvider.controller
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (urr){setState(() {
          loadingPercentage=0;
        });},
        onProgress: (progress){setState(() {
          loadingPercentage= progress;
        });},
        onPageFinished: (urr){setState(() {
          loadingPercentage=100;
        });},
        onNavigationRequest: (navigation){
          final host = Uri.parse(navigation.url).host;
          if(host.contains("youtube.com")){
            // scaffoldkey.currentState!.showSnackBar(SnackBar(content: Text("Blocking navigation to $host",
            //         style: TextStyle(color: Colors.red),), duration: Duration(seconds: 4),));
            // ScaffoldMessenger.of(super.context).showSnackBar(SnackBar(content: Text("Blocking navigation to $host",
            //     style: TextStyle(color: Colors.red),), duration: Duration(seconds: 4),));
            // Builder(builder: (BuildContext context){
            //
            // });
            // Future.delayed(Duration.zero).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blocking navigation to $host",
            //   style: TextStyle(color: Colors.red),), duration: Duration(seconds: 4),)));
            // WidgetsBinding.instance!.addPostFrameCallback((_) {
              final snackBar = SnackBar(content: Text("Blocking navigation to $host"),);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blocking navigation to $host")
            ));
            // });
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
    ..loadRequest(Uri.parse(url!),);
  }
  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsChangeNotifier>(context);

    return Stack(children: [WebViewWidget(controller: newsProvider.controller),
      if(loadingPercentage<100) Center(child: LinearProgressIndicator(value: loadingPercentage/100.0,))]);

  }

}


import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'View/home/home_view.dart';
import 'View/snack_bar.dart';
import 'View/splash_view.dart';
import 'changenotifier/news_change_notifier.dart';
import 'core/style/theme.dart';
import 'locale/locale_controller.dart';

void main() {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  runApp(ChangeNotifierProvider(
      create: (context) => NewsChangeNotifier(), child: MyApp()));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final Future initFuture = initfu();
  // Future initfu()async{
  //   await Future.delayed(Duration(seconds: 10));
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(MyLocalController());
    var newsprovider = Provider.of<NewsChangeNotifier>(context);
    // return GetMaterialApp(
    return MaterialApp(
      scaffoldMessengerKey: scaffoldkey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale("en"), Locale("ar")],
      locale: Locale(newsprovider.currentLocale),
      // locale: Get.deviceLocale,
      // translations: MyLocale(),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeView.routeName: (context) => HomeView()
      },
      // initialRoute: SplashView.routeName,
      initialRoute: SplashView.routeName,
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      // home: FutureBuilder(future: initFuture,
      // FutureBuilder(future: Future.delayed(Duration(seconds: 5)),
      //     builder: (context, timer)=>timer.connectionState==ConnectionState.done
      //   ?HomeView(): SplashView()),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

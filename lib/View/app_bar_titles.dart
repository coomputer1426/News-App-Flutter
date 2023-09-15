import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeAppBarTitle extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Text(AppLocalizations.of(context)!.route_app ,style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 22),);
  }

}
class SettingsTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(AppLocalizations.of(context)!.settings ,style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 22),);
  }

}



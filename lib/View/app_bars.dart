import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app_route_bloc_clean_arch/changenotifier/news_change_notifier.dart';



class appBartitleWidget extends StatelessWidget{
  var searchController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsChangeNotifier>(context);
    // TODO: implement build
    return TextField(decoration: InputDecoration(hintText: "Search Article",
        prefixIcon:
          IconButton(onPressed: (){
            if(searchController.value.text==""){
            newsProvider.changeAppBarTitle();
            newsProvider.changeActions(1);
            }
          else {searchController!.clear();}
        }, icon: Icon(Icons.close)
        ),
        fillColor: Colors.white, filled: true,
        suffixIcon:
        IconButton(onPressed: (){
          if(searchController.value.text==""){return;}

          debugPrint("Controller ${searchController.value.text}");
          FocusManager.instance.primaryFocus?.unfocus();
          newsProvider.changeSearch(searchController.value.text);
        }, icon: Icon(Icons.search)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintStyle: TextStyle(color: Color(0xff39A552).withOpacity(0.28))),
      keyboardType: TextInputType.text,
      controller: searchController,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app_route_bloc_clean_arch/View/category/source_tab_item.dart';

import '../../core/model/Source.dart';
import '../news/news_list.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;
  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(onTap: (index){
              setState(() {
                debugPrint(widget.sources[index].id);
              selectedIndex = index;
              });
            },
              tabs: widget.sources
                  .map((e) =>
                    SourceTab(e, widget.sources.indexOf(e)==selectedIndex))
                  // Tab(
                  //       text: e.name,
                  //     ))
                  .toList(),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              // labelColor: Colors.black,
            ),
            Expanded(child: NewsList(widget.sources[selectedIndex])),
          ],
        ),
      ),
    );
  }
}

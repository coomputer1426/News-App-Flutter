import 'package:flutter/material.dart';
import 'package:news_app_route_bloc_clean_arch/core/model/Source.dart';

class SourceTab extends StatelessWidget {
  Source source;
  bool selected;

  SourceTab(this.source, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: selected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border:
              Border.all(color: Theme.of(context).primaryColor, width: 1.5)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: selected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}

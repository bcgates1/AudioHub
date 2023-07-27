import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/search/widgets/search_box_filter.dart';
import 'package:audiohub/views/search/widgets/search_not_found.dart';
import 'package:flutter/material.dart';


class SearchScrn extends StatelessWidget {
  const SearchScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      appBar: AppbarCom(title: 'Search'),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchBoxWithFilter(),
          Expanded(
            child: SearchNotFound(),
          )
        ],
      ),
    ));
  }
}

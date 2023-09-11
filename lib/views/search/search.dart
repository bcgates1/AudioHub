import 'package:audiohub/controllers/search/search_ctrl.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/search/widgets/search_box_filter.dart';
import 'package:audiohub/views/search/widgets/search_found_gridlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScrn extends StatelessWidget {
  const SearchScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => SearchCtrl(),
        builder: (context, child) {
          final searchCtrl = Provider.of<SearchCtrl>(context, listen: false);
          searchCtrl.searchIntialize();

          return Scaffold(
            appBar: AppbarCom(title: 'Search'),
            body: Consumer<SearchCtrl>(
              builder: (context, value, child) => Column(
                children: [
                  SearchBoxWithFilter(),
                  searchCtrl.searchListDisplay.isEmpty
                      ? SizedBox(
                          height: kheight * 0.3,
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'Search for awesome products',
                                style: GoogleFonts.inter(color: Colors.black, fontSize: 17),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: SearchFoundGrid(),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

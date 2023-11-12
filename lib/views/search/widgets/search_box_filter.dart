import 'package:audiohub/controllers/search/search_ctrl.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchBoxWithFilter extends StatelessWidget {
  const SearchBoxWithFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCtrl = Provider.of<SearchCtrl>(context, listen: false);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black26),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          children: [
            TextField(
              controller: searchCtrl.searchController,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              onChanged: (value) => searchCtrl.search(value),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Search',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  searchCtrl.changeFilterVisibility();
                  searchCtrl.search(searchCtrl.searchController.text);

                  //filter
                },
                child: SizedBox(
                  width: kwidth * 0.18,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        'Filter',
                        style: GoogleFonts.inter(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: searchCtrl.filterVisibility,
              child: Wrap(
                spacing: 10,
                children: List.generate(
                  searchCtrl.allBrands.length,
                  (index) => ChoiceChip(
                    selectedColor: Colors.grey,
                    selected: searchCtrl.selectedIndex == index,
                    label: Text(searchCtrl.allBrands[index]['name']),
                    onSelected: (value) {
                      searchCtrl.choiceChipsSelect(index: index);
                      searchCtrl.search(searchCtrl.searchController.text);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

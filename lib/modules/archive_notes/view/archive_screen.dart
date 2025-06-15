import 'package:flutter/material.dart';

import '../../../custom-widget/widget/app_bar_design.dart';
import '../../../custom-widget/widget/card_items.dart';
import '../../bottom_sheet/view/bottom_sheet_screen.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarDesign(context),
      body: ListView.separated(
        itemBuilder:
            (context, index) => CardItems(
              text:
                  "as opposed to using 'Content here, content here', making ",
              editOnPressed: () {},
              deleteOnPressed: (){},
            ),
        separatorBuilder: (context, index) => Container(),
        itemCount: 10,
      ),
    );
  }
}


AppBarDesign _appBarDesign(context) {
  return AppBarDesign(
    title: 'NOTES',
    onPressedIcon: () {
      showModalBottomSheet(
        context: context,
        builder: (context) => const BottomSheetScreen(),
      );
    },
  );}

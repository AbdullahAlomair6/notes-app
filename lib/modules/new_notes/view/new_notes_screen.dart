import 'package:flutter/material.dart';

import '../../../custom-widget/widget/app_bar_design.dart';
import '../../../custom-widget/widget/card_items.dart';
import '../../bottom_sheet/view/bottom_sheet_screen.dart';

class NewNotesScreen extends StatelessWidget {
  const NewNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarDesign(context),
      body: ListView.separated(
        itemBuilder:
            (context, index) => CardItems(
              text:
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page",
              editOnPressed: () {},
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
  );
}

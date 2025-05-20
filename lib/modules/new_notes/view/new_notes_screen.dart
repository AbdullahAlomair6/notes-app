import 'package:flutter/material.dart';

import '../../../custom-widget/widget/appBar.dart';
import '../../../custom-widget/widget/card_items.dart';

class NewNotesScreen extends StatelessWidget {
  const NewNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesign(title: 'NOTES'),
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

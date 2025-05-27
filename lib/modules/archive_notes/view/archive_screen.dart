import 'package:flutter/material.dart';

import '../../../custom-widget/widget/appBar.dart';
import '../../../custom-widget/widget/card_items.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesign(title: 'Archive'),
      body: ListView.separated(
        itemBuilder:
            (context, index) => CardItems(
              text:
                  "content of a page  point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page",
              editOnPressed: () {},
            ),
        separatorBuilder: (context, index) => Container(),
        itemCount: 10,
      ),
    );
  }
}

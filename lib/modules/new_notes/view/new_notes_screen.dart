import 'package:flutter/material.dart';
import 'package:notes_app/modules/new_notes/view/widget.dart';

class NewNotesScreen extends StatelessWidget {
  const NewNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDesign(),
      body:ListView.separated(
          itemBuilder: (context,index)=> cardItems(),
          separatorBuilder:(context,index)=>Container(),
          itemCount: 10
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/modules/new_notes/bloc/new_notes_state.dart';

import '../../../custom-widget/widget/app_bar_design.dart';
import '../../../custom-widget/widget/card_items.dart';
import '../../bottom_sheet/view/bottom_sheet_screen.dart';
import '../bloc/new_notes_cubit.dart';

class NewNotesScreen extends StatelessWidget {
  const NewNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewNotesCubit()..readData(),
      child: BlocBuilder<NewNotesCubit, NewNotesState>(
        builder: (context, state) {
          final notesData = context.watch<NewNotesCubit>().getListData;
          return Scaffold(
            appBar: _appBarDesign(context),
            body:
                notesData.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                      itemBuilder:
                          (context, index) => CardItems(
                            text: "${notesData[index]['note']}",
                            editOnPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder:
                                    (context) => BottomSheetScreen(
                                      note: notesData[index],
                                    ),
                              );
                            },
                            deleteOnPressed: () {
                              context.read<NewNotesCubit>().deleteData(
                                notesData[index],
                              );
                            },
                          ),
                      separatorBuilder: (context, index) => Container(),
                      itemCount: notesData.length,
                    ),
          );
        },
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

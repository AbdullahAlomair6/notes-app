import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom-widget/widget/app_bar_design.dart';
import '../../../custom-widget/widget/card_items.dart';
import '../../bottom_sheet/bloc/bottom_sheet_cubit.dart';
import '../../bottom_sheet/bloc/bottom_sheet_state.dart';
import '../../bottom_sheet/view/bottom_sheet_screen.dart';

class NewNotesScreen extends StatelessWidget {
  const NewNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map>? notesData;

    return BlocProvider(
      create: (context) => BottomSheetCubit(),
      child: BlocBuilder<BottomSheetCubit, BottomSheetState>(
        builder: (context, state) {
          if (state is ReadNoteState) {
            notesData = state.response;
          }
          return Scaffold(
            appBar: _appBarDesign(context),
            body: ListView.separated(
              itemBuilder:
                  (context, index) => CardItems(
                    text: "${notesData![index]}",
                    editOnPressed: () {},
                  ),
              separatorBuilder: (context, index) => Container(),
              itemCount: notesData!.length,
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

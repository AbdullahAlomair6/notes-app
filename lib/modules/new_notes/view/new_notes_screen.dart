import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/app_routes.dart';
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
      create: (BuildContext context) => NewNotesCubit()..readData(),
      child: BlocBuilder<NewNotesCubit, NewNotesState>(
        builder: (context, state) {
          if (state is ReadNoteStateSuccess) {
            var cubit = NewNotesCubit.get(context);
            List<Map> notesData = state.response;
            return Scaffold(
              appBar: _appBarDesign(context, cubit),
              body: ListView.separated(
                itemBuilder:
                    (context, index) => CardItems(
                      text: "${notesData[index]['note']}",
                      editOnPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder:
                              (context) =>
                                  BottomSheetScreen(note: notesData[index]),
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
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

AppBarDesign _appBarDesign(context,cubit1) {
  return AppBarDesign(
    title: 'NOTES',
    onPressedIcon: () {
      // showModalBottomSheet(
      //   context: context,
      //   builder: (context) => const BottomSheetScreen(),
      // );
    },
    exitIconShow: true,
    onPressedIconExit: () {
      NewNotesCubit().signOut();
      GoRouter.of(context).pushReplacementNamed(AppRouter.loginScreen.name);
    },
  );
}

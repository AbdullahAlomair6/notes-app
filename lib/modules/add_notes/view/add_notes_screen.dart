import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/custom-widget/widget/custom_edittext.dart';
import 'package:notes_app/modules/add_notes/bloc/add_note_cubit.dart';
import 'package:notes_app/modules/add_notes/bloc/add_note_state.dart';
import 'package:notes_app/modules/home/bloc/home_cubit.dart';

import '../../../custom-widget/widget/app_bar_design.dart';
import '../../../custom-widget/widget/custom_button.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (BuildContext context, state) {
        var cubit = context.read<AddNoteCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBarDesign(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: cubit.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Note Here',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  CustomEdittext(
                    controller: cubit.noteController,
                    hint: 'Write your Note Here! ',
                    validator: (String? value) {
                      return cubit.addNoteValidator(value);
                    },
                  ),
                  Spacer(),
                  CustomButton(
                    text: 'dd Note',
                    icons: Icons.add,
                    onPressed: () async {
                      if (cubit.checkOnPressed()) {
                        Navigator.pop(context);
                        await context.read<HomeCubit>().getNoteData();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

AppBarDesign _appBarDesign() {
  return AppBarDesign(title: 'Add New Note');
}

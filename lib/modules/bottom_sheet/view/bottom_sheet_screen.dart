import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/modules/new_notes/bloc/new_notes_state.dart';

import '../../../custom-widget/widget/custom_edittext.dart';
import '../../new_notes/bloc/new_notes_cubit.dart';
import '../bloc/bottom_sheet_cubit.dart';
import '../bloc/bottom_sheet_state.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key, this.note});

  final Map? note;
  //final NewNotesCubit cubit;

  @override
  Widget build(BuildContext context) {
    var cubit =  context.read<NewNotesCubit>();
        return Container(
          height: 250,
          key: cubit.formKey,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomEdittext(
                  label: 'Note',
                  hint: 'Write your note',
                  controller: cubit.noteController,
                ),
                //SizedBox(height: 10),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (note != null) {
                        cubit.updateData(note!);
                      } else {
                        cubit.insertData();
                      }
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.orangeAccent,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'ADD',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        );
      }
  }


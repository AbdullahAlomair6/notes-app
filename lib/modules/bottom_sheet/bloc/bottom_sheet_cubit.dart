import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/modules/new_notes/bloc/new_notes_cubit.dart';

import '../../../helper/database_helper/database_helper.dart';
import 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(InitialState());

  final formKey = GlobalKey<FormState>();
  var noteController = TextEditingController();
  DatabaseHelper notesDb = DatabaseHelper();
  NewNotesCubit newCubit = NewNotesCubit();

  insertData() async {
    await notesDb.insertData('''
        INSERT INTO notes(note)
        VALUES ("${noteController.text}")
        ''');
    newCubit.readData();
    emit(UpdateNotes());
  }

  updateData(Map<dynamic, dynamic> data) async {
    await notesDb.updateData(
      "UPDATE notes SET note = '${noteController.text}' WHERE id = ${data['id']}",
    );
    emit(UpdateNotes());
  }
}

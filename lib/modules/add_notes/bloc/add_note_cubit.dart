import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/database_helper/database_helper.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(InitialState());

  DatabaseHelper notesDb = DatabaseHelper();

  final TextEditingController noteController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> insertData() async {
    await notesDb.insertData(noteController.text);

    emit(InsertNote());
  }

  String? addNoteValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Add Your Note ';
    }
    return null;
  }

  bool checkOnPressed() {
    if (key.currentState?.validate() ?? false) {
      insertData();
      noteController.clear();
      return true;
    }
    return false;
  }

  // updateData(Map<dynamic, dynamic> data) async {
  //   await notesDb.updateData(noteController.text, data);
  //   emit(UpdateNotes());
  // }
}

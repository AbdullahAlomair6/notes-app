import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/database_helper/database_helper.dart';
import 'new_notes_state.dart';

class NewNotesCubit extends Cubit<NewNotesState> {
  NewNotesCubit() : super(InitialState());

  DatabaseHelper notesDb = DatabaseHelper();

  readData() async {
    List<Map> response = await notesDb.readData("SELECT * FROM notes");
    emit(ReadNoteState(response));
  }

  deleteData(Map<dynamic, dynamic> data) async {
    await notesDb.deleteData("DELETE FROM notes WHERE id = ${data['id']}");
    readData();
  }

  // updateData(String text,Map<dynamic, dynamic> data)async{
  //   await notesDb.updateData("UPDATE notes SET note = '$text' WHERE id = ${data['id']}");
  //
  // }
}

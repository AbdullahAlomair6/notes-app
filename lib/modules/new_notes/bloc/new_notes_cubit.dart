import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/database_helper/database_helper.dart';
import 'new_notes_state.dart';

class NewNotesCubit extends Cubit<NewNotesState> {
  NewNotesCubit() : super(InitialState());

  DatabaseHelper notesDb = DatabaseHelper();

  List<Map> getListData = [];

  readData() async {
    emit(ReadNoteState());
    getListData = await notesDb.readData("SELECT * FROM notes");
    //print(getListData);
    emit(ReadNoteStateSuccess());
  }

  deleteData(Map<dynamic, dynamic> data) async {
    await notesDb.deleteData("DELETE FROM notes WHERE id = ${data['id']}");
    readData();
  }
}

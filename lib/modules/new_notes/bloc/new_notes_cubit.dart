import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/database_helper/database_helper.dart';
import 'new_notes_state.dart';

class NewNotesCubit extends Cubit<NewNotesState> {
  NewNotesCubit() : super(InitialState());

  DatabaseHelper notesDb = DatabaseHelper();

  Future<void> readData() async {
    emit(ReadNoteState());
    List<Map> getListData = await notesDb.readData();
    emit(ReadNoteStateSuccess(getListData));
  }

  deleteData(Map<dynamic, dynamic> data) async {
    await notesDb.deleteData(data);
    readData();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

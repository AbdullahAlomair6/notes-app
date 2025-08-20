import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/database_helper/database_helper.dart';
import 'new_notes_state.dart';

class NewNotesCubit extends Cubit<NewNotesState> {
  NewNotesCubit() : super(InitialState());

  DatabaseHelper notesDb = DatabaseHelper();

  final formKey = GlobalKey<FormState>();
  var noteController = TextEditingController();

  static NewNotesCubit get(context) => BlocProvider.of(context);

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

  insertData() async {
    await notesDb.insertData(noteController.text);
    readData();
  }

  updateData(Map<dynamic, dynamic> data) async {
    print('addd dcmdcd -------------------------');
    await notesDb.updateData(noteController.text, data);
    readData();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/database_helper/database_helper.dart';
import 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(InitialState());

  final formKey = GlobalKey<FormState>();
  var noteController = TextEditingController();
  DatabaseHelper notesDb = DatabaseHelper();

  Future<List<Map>> readData() async {
    List<Map> response = await notesDb.readData("SELECT * FROM notes");
    emit(ReadNoteState(response));
    return response;
  }
}

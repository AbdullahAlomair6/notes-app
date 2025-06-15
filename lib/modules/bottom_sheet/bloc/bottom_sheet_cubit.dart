import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/database_helper/database_helper.dart';
import 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(InitialState());

  final formKey = GlobalKey<FormState>();
  var noteController = TextEditingController();
  DatabaseHelper notesDb = DatabaseHelper();


  insertData() async {
    await notesDb.insertData('''
        INSERT INTO notes(note)
        VALUES ("${noteController.text}")
        ''');
    emit(UpdateNotes());
  }

  updateData(String text,Map<dynamic, dynamic> data)async{
    await notesDb.updateData("UPDATE notes SET note = '$text' WHERE id = ${data['id']}");

  }
}

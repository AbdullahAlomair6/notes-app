import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/modules/home/bloc/home_state.dart';

import '../../../helper/database_helper/database_helper.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  DatabaseHelper notesDb = DatabaseHelper();


  Future<void> getNoteData() async {
    emit(DataLoading());
    List<Map> getListData = await notesDb.readData();
    emit(GetNoteDataSuccessState(getListData));
  }

  deleteData(Map<dynamic, dynamic> data) async {
    await notesDb.deleteData(data);
    getNoteData();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }


}

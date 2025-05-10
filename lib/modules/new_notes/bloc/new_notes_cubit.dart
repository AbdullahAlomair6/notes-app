import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_notes_state.dart';

class NewNotesCubit extends Cubit<NewNotesState>{
  NewNotesCubit() : super (InitialState());


}
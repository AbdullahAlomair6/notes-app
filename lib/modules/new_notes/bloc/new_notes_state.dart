abstract class NewNotesState{}

class InitialState extends NewNotesState {}

class ReadNoteState extends NewNotesState {
  List<Map> response;

  ReadNoteState(this.response);
}

class InsertNoteState extends NewNotesState {}

class UpdateNoteState extends NewNotesState {}

class DeleteNoteState extends NewNotesState {}
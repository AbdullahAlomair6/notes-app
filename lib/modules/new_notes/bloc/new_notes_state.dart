abstract class NewNotesState {}

class InitialState extends NewNotesState {}

class ReadNoteState extends NewNotesState {}

class ReadNoteStateSuccess extends NewNotesState {
  ReadNoteStateSuccess(this.response);

  List<Map> response;
}

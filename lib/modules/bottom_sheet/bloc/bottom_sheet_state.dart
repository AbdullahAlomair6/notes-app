abstract class BottomSheetState {}

class InitialState extends BottomSheetState {}
// class ChangeNoteState extends BottomSheetState{
//   final dynamic notes;
//   ChangeNoteState(this.notes);
//
// }

class ReadNoteState extends BottomSheetState {
   List<Map> response;

  ReadNoteState(this.response);
}

class InsertNoteState extends BottomSheetState {}

class UpdateNoteState extends BottomSheetState {}

class DeleteNoteState extends BottomSheetState {}

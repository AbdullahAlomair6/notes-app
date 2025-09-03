abstract class HomeState {}

class InitialState extends HomeState {}

class DataLoading extends HomeState {}

class GetNoteDataSuccessState extends HomeState {
  GetNoteDataSuccessState(this.response);

  List<Map> response;
}

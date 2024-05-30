import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedViewBloc extends Bloc<SelectedViewEvent, int> {
  SelectedViewBloc() : super(1) {
    on<GoEngineerListViewEvent>((event, emit) {
      emit(0);
    });
    on<GoSettingListViewEvent>(
      (event, emit) {
        emit(2);
      },
    );
    on<GoHomeViewEvent>(
      (event, emit) {
        emit(1);
      },
    );
  }
}

class SelectedViewEvent {}

class GoEngineerListViewEvent extends SelectedViewEvent {}

class GoSettingListViewEvent extends SelectedViewEvent {}

class GoHomeViewEvent extends SelectedViewEvent {}

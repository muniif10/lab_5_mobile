import 'package:flutter_bloc/flutter_bloc.dart';

class LoggedInBloc extends Bloc<LoggedInEvent, bool> {
  LoggedInBloc() : super(false) {
    on<LoggedInEvent>((event, emit) {
      emit(true);
    });
  }
}

class LoggedInEvent {}

class LogInEvent extends LoggedInEvent {
  LogInEvent();
}
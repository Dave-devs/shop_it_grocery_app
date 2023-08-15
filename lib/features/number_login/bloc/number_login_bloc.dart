import 'dart:async';
import 'package:bloc/bloc.dart';
part 'number_login_event.dart';
part 'number_login_state.dart';

class NumberLoginBloc extends Bloc<NumberLoginEvent, NumberLoginState> {
  NumberLoginBloc() : super(const NumberLoginState()) {

    on<OnNumberLoginEventClick>(onNumberLoginEventClick);
  }



  FutureOr<void> onNumberLoginEventClick(OnNumberLoginEventClick event, Emitter<NumberLoginState> emit) {
    emit(state.copyWith(phoneNumber: event.number));
  }
}
